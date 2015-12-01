/*
 * #%L
 * org.eclipse.emf.eson.ui
 * %%
 * Copyright (C) 2013 - 2014 Michael Vorburger and others
 * %%
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 * #L%
 */
package org.eclipse.emf.eson.ui.editor.tree;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.EventObject;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.eclipse.emf.common.command.BasicCommandStack;
import org.eclipse.emf.common.command.Command;
import org.eclipse.emf.common.command.CommandStack;
import org.eclipse.emf.common.command.CommandStackListener;
import org.eclipse.emf.common.notify.AdapterFactory;
import org.eclipse.emf.common.notify.impl.AdapterImpl;
import org.eclipse.emf.common.ui.celleditor.ExtendedDialogCellEditor;
import org.eclipse.emf.common.ui.viewer.ColumnViewerInformationControlToolTipSupport;
import org.eclipse.emf.ecore.EAttribute;
import org.eclipse.emf.ecore.EDataType;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EReference;
import org.eclipse.emf.ecore.EStructuralFeature;
import org.eclipse.emf.ecore.plugin.EcorePlugin;
import org.eclipse.emf.ecore.presentation.EcoreEditorPlugin;
import org.eclipse.emf.ecore.provider.EcoreItemProviderAdapterFactory;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.edit.command.CommandParameter;
import org.eclipse.emf.edit.command.DeleteCommand;
import org.eclipse.emf.edit.domain.AdapterFactoryEditingDomain;
import org.eclipse.emf.edit.domain.EditingDomain;
import org.eclipse.emf.edit.domain.IEditingDomainProvider;
import org.eclipse.emf.edit.provider.ComposedAdapterFactory;
import org.eclipse.emf.edit.provider.IItemPropertyDescriptor;
import org.eclipse.emf.edit.provider.IItemPropertySource;
import org.eclipse.emf.edit.provider.ReflectiveItemProviderAdapterFactory;
import org.eclipse.emf.edit.provider.resource.ResourceItemProviderAdapterFactory;
import org.eclipse.emf.edit.ui.action.EditingDomainActionBarContributor;
import org.eclipse.emf.edit.ui.celleditor.AdapterFactoryTreeEditor;
import org.eclipse.emf.edit.ui.dnd.EditingDomainViewerDropAdapter;
import org.eclipse.emf.edit.ui.dnd.LocalTransfer;
import org.eclipse.emf.edit.ui.dnd.ViewerDragAdapter;
import org.eclipse.emf.edit.ui.provider.AdapterFactoryContentProvider;
import org.eclipse.emf.edit.ui.provider.AdapterFactoryLabelProvider;
import org.eclipse.emf.edit.ui.provider.DecoratingColumLabelProvider;
import org.eclipse.emf.edit.ui.provider.DiagnosticDecorator;
import org.eclipse.emf.edit.ui.provider.PropertyDescriptor;
import org.eclipse.emf.edit.ui.provider.UnwrappingSelectionProvider;
import org.eclipse.emf.eson.building.ModelBuilderException;
import org.eclipse.emf.eson.eFactory.Attribute;
import org.eclipse.emf.eson.eFactory.Factory;
import org.eclipse.emf.eson.eFactory.Feature;
import org.eclipse.emf.eson.eFactory.NewObject;
import org.eclipse.emf.eson.eFactory.Reference;
import org.eclipse.emf.eson.eFactory.impl.FactoryImpl;
import org.eclipse.emf.eson.resource.EFactoryResource;
import org.eclipse.jface.action.IMenuListener;
import org.eclipse.jface.action.IMenuManager;
import org.eclipse.jface.action.MenuManager;
import org.eclipse.jface.action.Separator;
import org.eclipse.jface.text.ITextSelection;
import org.eclipse.jface.util.LocalSelectionTransfer;
import org.eclipse.jface.viewers.CellEditor;
import org.eclipse.jface.viewers.IPostSelectionProvider;
import org.eclipse.jface.viewers.ISelection;
import org.eclipse.jface.viewers.ISelectionChangedListener;
import org.eclipse.jface.viewers.ISelectionProvider;
import org.eclipse.jface.viewers.IStructuredSelection;
import org.eclipse.jface.viewers.ITreeSelection;
import org.eclipse.jface.viewers.SelectionChangedEvent;
import org.eclipse.jface.viewers.StructuredSelection;
import org.eclipse.jface.viewers.TreeViewer;
import org.eclipse.jface.viewers.Viewer;
import org.eclipse.jface.viewers.ViewerFilter;
import org.eclipse.jface.window.Window;
import org.eclipse.swt.SWT;
import org.eclipse.swt.custom.SashForm;
import org.eclipse.swt.dnd.DND;
import org.eclipse.swt.dnd.FileTransfer;
import org.eclipse.swt.dnd.Transfer;
import org.eclipse.swt.events.MouseAdapter;
import org.eclipse.swt.events.MouseEvent;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Control;
import org.eclipse.swt.widgets.Menu;
import org.eclipse.swt.widgets.Tree;
import org.eclipse.ui.IActionBars;
import org.eclipse.ui.IEditorInput;
import org.eclipse.ui.IEditorSite;
import org.eclipse.ui.IPageLayout;
import org.eclipse.ui.IWorkbench;
import org.eclipse.ui.IWorkbenchPage;
import org.eclipse.ui.IWorkbenchWindow;
import org.eclipse.ui.PartInitException;
import org.eclipse.ui.PlatformUI;
import org.eclipse.ui.contexts.IContextService;
import org.eclipse.ui.views.properties.IPropertyDescriptor;
import org.eclipse.ui.views.properties.PropertySheet;
import org.eclipse.xtext.nodemodel.ICompositeNode;
import org.eclipse.xtext.nodemodel.INode;
import org.eclipse.xtext.nodemodel.util.NodeModelUtils;
import org.eclipse.xtext.parser.IParseResult;
import org.eclipse.xtext.resource.IEObjectDescription;
import org.eclipse.xtext.resource.XtextResource;
import org.eclipse.xtext.ui.editor.XtextEditor;
import org.eclipse.xtext.ui.editor.model.IXtextDocument;
import org.eclipse.xtext.ui.label.GlobalDescriptionLabelProvider;
import org.eclipse.xtext.ui.search.IXtextEObjectSearch;
import org.eclipse.xtext.ui.search.XtextEObjectSearchDialog;
import org.eclipse.xtext.util.concurrent.IUnitOfWork;

public class EFactoryWithTreeEditor extends XtextEditor implements IEditingDomainProvider, IMenuListener, ISelectionProvider{
	private final static Logger LOGGER = Logger.getLogger(EFactoryWithTreeEditor.class);

	private TreeViewer selectionViewer;
	private AdapterFactoryEditingDomain editingDomain;
	private ComposedAdapterFactory adapterFactory;
	private Viewer currentViewer;
	private IXtextDocument document;
	private ResourceSet resourceSet;
	private ISelectionChangedListener selectionChangedListener;
	private Collection<ISelectionChangedListener> selectionChangedListeners = new ArrayList<ISelectionChangedListener>();
	private ISelection editorSelection = StructuredSelection.EMPTY;
  	private ISelectionChangedListener propertiesViewUpdater;
	private SashForm sashForm;
	private @Inject IXtextEObjectSearch eObjectSearch;
	private @Inject GlobalDescriptionLabelProvider globalDescriptionLabelProvider;

	public AdapterFactory getAdapterFactory() {
		return adapterFactory;
	}
	
	protected class EFactoryCommandStack extends BasicCommandStack {
		@Override
		public void execute(final Command command) {
			document.modify(new IUnitOfWork.Void<XtextResource>() {
				@Override
				public void process(XtextResource state) throws Exception {
					EFactoryCommandStack.super.execute(command);
				}
			});
		}
	}
    
	private void initializeEditingDomain() {
	    EFactoryCommandStack eFactoryCommandStack = new EFactoryCommandStack();
	    eFactoryCommandStack.addCommandStackListener
        (new CommandStackListener() {
            @Override
             public void commandStackChanged(final EventObject event) {
                 getContainer().getDisplay().asyncExec
                     (new Runnable() {
                          public void run() {
                              // Try to select the affected objects.
                              Command mostRecentCommand = ((CommandStack)event.getSource()).getMostRecentCommand();
                              if (mostRecentCommand != null) {
                                  setSelectionToViewer(mostRecentCommand.getAffectedObjects());
                              }
                          }
                      });
             }
         });
		editingDomain = new AdapterFactoryEditingDomain(adapterFactory, eFactoryCommandStack, resourceSet) {
			@Override
			public boolean isReadOnly(Resource resource) {
				return super.isReadOnly(resource) || getResourceSet().getResources().indexOf(resource) != 0;
			}
			
			@Override
			public Command createCommand(Class<? extends Command> commandClass, CommandParameter commandParameter) {
			    if (commandClass == DeleteCommand.class) {
			        //  we override Deletion because the default DeleteCommand.execute(), because that attempts to
			        // find the references to the object being deleted in the entire ResourceSet, potentially loading
			        // a huge amount of models, and thus "hanging" the UI in real-world  application. Since we are
			        // using Xtext here, we do not actually need to do that, so findReferences() just returns an
			        // emptyMap instead, meaning no references.
			        return new DeleteCommand(this, commandParameter.getCollection()) {
			            protected Map<EObject, Collection<EStructuralFeature.Setting>> findReferences(Collection<EObject> eObjects) {
			                return Collections.emptyMap();
			            };
			        };
			    }
			    return super.createCommand(commandClass, commandParameter);
			}
		};

		resourceSet.eAdapters().add(new EditingDomainProvider());
		resourceSet.getURIConverter().getURIMap().putAll(EcorePlugin.computePlatformURIMap(true));
	}
	
	private void setSelectionToViewer(Collection<?> collection) {
	    final Collection<?> theSelection = collection;
	    // Make sure it's okay.
	    if (theSelection != null && !theSelection.isEmpty()) {
	      Runnable runnable =
	        new Runnable() {
	          public void run() {
	            // Try to select the items in the tree viewer of the editor
	            if (selectionViewer != null) {
	            	if(selectionViewer.getTree().getItems().length <= 0){
	            		selectionViewer.setInput(getInputForSelectionViewer(editingDomain));
	            	}
	            	EObject treeRootEObject = (EObject) selectionViewer.getTree().getItem(0).getData();
            		EObject objectToFocus = (EObject) theSelection.iterator().next(); 
            		if (objectToFocus.eIsProxy()) {
            			// This is probably not great for performance, but must be here for a good reason...
            			objectToFocus = EcoreUtil.resolve(objectToFocus, treeRootEObject.eResource());
            		}
            		selectionViewer.setSelection(new StructuredSelection(objectToFocus), true);
	            }
	          }
	        };
	      getSite().getShell().getDisplay().asyncExec(runnable);
	    }
	  }

	protected Composite getContainer() {
		return sashForm;
	}
	
  	protected Object getInputForSelectionViewer(EditingDomain editingDomain) {
		Resource resource = editingDomain.getResourceSet().getResources().get(0);
		return resource;
	}     
      
	@Override
    public void createPartControl(Composite parent) {
		sashForm = new SashForm(parent, SWT.HORIZONTAL);
		// composite to have control on the xtextEditor control created by super class.
		final Composite leftComposite = new Composite(sashForm, SWT.NONE);
		leftComposite.setLayout(new FillLayout());
			super.createPartControl(leftComposite);
			getSourceViewer().getTextWidget().addMouseListener(new MouseAdapter() {
				@Override
				public void mouseDoubleClick(MouseEvent e) {
					maximizeControl(leftComposite);
				}
			}); 
             document = getDocument();
             resourceSet = document.readOnly(new IUnitOfWork<ResourceSet, XtextResource>() {
				public ResourceSet exec(final XtextResource xtextResource) throws Exception {
					return xtextResource.getResourceSet();
					}
				});
            adapterFactory = new ComposedAdapterFactory(ComposedAdapterFactory.Descriptor.Registry.INSTANCE);
            adapterFactory.addAdapterFactory(new ResourceItemProviderAdapterFactory());
            adapterFactory.addAdapterFactory(new EcoreItemProviderAdapterFactory());
            adapterFactory.addAdapterFactory(new ReflectiveItemProviderAdapterFactory());
            
            initializeEditingDomain();
            
     		propertiesViewUpdater = createPropertiesViewUpdater();
    		if (getSelectionProvider() instanceof IPostSelectionProvider) {
    			((IPostSelectionProvider) getSelectionProvider()).addPostSelectionChangedListener(propertiesViewUpdater);
    		}
    		
             final Tree tree = new Tree(sashForm, SWT.MULTI);
             selectionViewer = new NonCollapsingTreeViewer(tree);
             setCurrentViewer(selectionViewer);

             selectionViewer.setContentProvider(new AdapterFactoryContentProvider(adapterFactory));
             selectionViewer.setLabelProvider(new DecoratingColumLabelProvider(new AdapterFactoryLabelProvider(adapterFactory), new DiagnosticDecorator(editingDomain, selectionViewer, EcoreEditorPlugin.getPlugin().getDialogSettings())));
             selectionViewer.setInput(getInputForSelectionViewer(editingDomain));
             selectionViewer.setSelection(new StructuredSelection(editingDomain.getResourceSet().getResources().get(0)), true);
             selectionViewer.addSelectionChangedListener(propertiesViewUpdater);
             selectionViewer.expandAll();
             tree.addMouseListener(new MouseAdapter() {
     			@Override
     			public void mouseDoubleClick(MouseEvent e) {
     				maximizeControl(tree);
     			}
     		 });
             
             new AdapterFactoryTreeEditor(selectionViewer.getTree(), adapterFactory);
             new ColumnViewerInformationControlToolTipSupport(selectionViewer, new DiagnosticDecorator.EditingDomainLocationListener(editingDomain, selectionViewer));
             getSite().setSelectionProvider(this);
             createContextMenuFor(selectionViewer);

             ViewerFilter filter = new ViewerFilter() {
 				@Override
 				public boolean select(Viewer viewer, Object parentElement, Object element) {
 					return (!(element instanceof FactoryImpl));
 				}
 		      };
 		      selectionViewer.addFilter(filter);
      }

	  private void createContextMenuFor(TreeViewer viewer) {
          MenuManager contextMenu = new MenuManager("#PopUp");
          contextMenu.add(new Separator("additions"));
          contextMenu.setRemoveAllWhenShown(true);
          contextMenu.addMenuListener(this);
          Menu menu = contextMenu.createContextMenu(viewer.getControl());
          viewer.getControl().setMenu(menu);
          getSite().registerContextMenu(contextMenu,
                          new UnwrappingSelectionProvider(viewer));
  
          int dndOperations = DND.DROP_COPY | DND.DROP_MOVE | DND.DROP_LINK;
          Transfer[] transfers = new Transfer[] { LocalTransfer.getInstance(), LocalSelectionTransfer.getTransfer(), FileTransfer.getInstance() };
          viewer.addDragSupport(dndOperations, transfers, new ViewerDragAdapter(viewer));
          viewer.addDropSupport(dndOperations, transfers, new EditingDomainViewerDropAdapter(editingDomain, viewer));
	}


	private class EditingDomainProvider extends AdapterImpl implements IEditingDomainProvider {
	    	public EditingDomain getEditingDomain() {
				return editingDomain;
			}
			@Override
			public boolean isAdapterForType(Object type) {
				return IEditingDomainProvider.class.equals(type);
			}
	}


	public EditingDomain getEditingDomain() {
		return editingDomain;
	}
	
	 /**
     * This implements {@link org.eclipse.jface.action.IMenuListener} to help
     * fill the context menus with contributions from the Edit menu. 
     */
    public void menuAboutToShow(IMenuManager menuManager) {
    	((IMenuListener) getEditorSite()
    			.getActionBarContributor())
                .menuAboutToShow(menuManager);
    }

    public EditingDomainActionBarContributor getActionBarContributor() {
    	return (EditingDomainActionBarContributor) getEditorSite()
    			.getActionBarContributor();
    }

    public IActionBars getActionBars() {
    	return getActionBarContributor().getActionBars();
    }
    
	public void addSelectionChangedListener(ISelectionChangedListener listener) {
		selectionChangedListeners.add(listener);		
	}
	
	public ISelection getSelection() {
		return editorSelection;
	}
	
	public void removeSelectionChangedListener(ISelectionChangedListener listener) {
		selectionChangedListeners.remove(listener);
		
	}
	
	public void setSelection(ISelection selection) {
		editorSelection = selection;
		for (ISelectionChangedListener listener : selectionChangedListeners) {
			listener.selectionChanged(new SelectionChangedEvent(getSelectionProvider(), selection));
		}
	}
	
	/**
	 * This makes sure that one content viewer, either for the current page or the outline view, if it has focus,
	 * is the current one.
	 */
	protected void setCurrentViewer(Viewer viewer) {
		// If it is changing...
		//
		if (currentViewer != viewer) {
			if (selectionChangedListener == null) {
				// Create the listener on demand.
				selectionChangedListener = new ISelectionChangedListener() {
					// This just notifies those things that are affected by the section.
					public void selectionChanged(SelectionChangedEvent selectionChangedEvent) {
						setSelection(selectionChangedEvent.getSelection());
					}
				};
			}

			// Stop listening to the old one.
			if (currentViewer != null) {
				currentViewer.removeSelectionChangedListener(selectionChangedListener);
				currentViewer.removeSelectionChangedListener(propertiesViewUpdater);
			}

			// Start listening to the new one.
			if (viewer != null) {
				viewer.addSelectionChangedListener(selectionChangedListener);
				viewer.addSelectionChangedListener(propertiesViewUpdater);
			}

			// Remember it.
			currentViewer = viewer;
			
			// Set the editors selection based on the current viewer's selection.
			setSelection(currentViewer == null ? StructuredSelection.EMPTY : currentViewer.getSelection());
		}
	}
		
	
	private ISelectionChangedListener createPropertiesViewUpdater() {
			return new ISelectionChangedListener() {
				public void selectionChanged(SelectionChangedEvent event) {
					try {
						ISelection selection = event.getSelection();
						if (selection.isEmpty()) return;
						if (selection instanceof ITextSelection) {
							final ITextSelection textSelection = (ITextSelection) selection;
							getDocument().readOnly(new IUnitOfWork.Void<XtextResource>() {
								public void process(XtextResource xtextResource) throws Exception {
									IParseResult parseResult = xtextResource.getParseResult();
									if (parseResult != null) {
										final EFactoryResource eFactoryResource = (EFactoryResource) xtextResource;
										ICompositeNode rootNode = parseResult.getRootNode();
										int offset = textSelection.getOffset();
										INode node = NodeModelUtils.findLeafNodeAtOffset(rootNode, offset);
										EObject semanticObject = NodeModelUtils.findActualSemanticObjectFor(node);
										if (semanticObject instanceof Reference) {
											semanticObject = ((Reference)semanticObject).eContainer();
										} else if (semanticObject instanceof Attribute) {
											semanticObject = ((Attribute)semanticObject).eContainer();
										}
										
										EObject selectedObject = getSelectedRealObject(eFactoryResource, semanticObject);
										// For those text selection offset which does not give proper object (currently giving empty object), find a suitable less-useless fallback
										if(selectedObject == null) {
											// This, as implemented today, actually causes more harm than use...
											//    ... e.g. if you click into a /* commented out */ section at the end of the document,
											//    not visible in the first scroll page, then it causes a jumping effect that is clearly wrong.
											// selectedObject = getFallbackSelectedRealObject(eFactoryResource, semanticObject);
										}
										if (selectedObject != null) {
											// synchronized the treeViewer/properties view
											updatePropertiesView(buildStructuredSelection(selectedObject));
											// this code will change the position of the caret in the XTextDocument
											setSelectionToViewer(selectedObject != null ? Arrays.asList(selectedObject) : Collections.emptyList()); 
										}
									}
								}
							});
						
						} else if (selection instanceof ITreeSelection) {
							final ITreeSelection treeSelection = (ITreeSelection) selection;

							// update selection in the XText Document
							getDocument().readOnly(
								new IUnitOfWork<Object, XtextResource>() {
									public Object exec(XtextResource xtextResource) throws Exception {
										Object object = treeSelection.getFirstElement();
										if (object instanceof EObject) {
											final EFactoryResource eFactoryResource = (EFactoryResource) xtextResource;
											NewObject newObject = eFactoryResource.getEFactoryNewObject((EObject) object);
											if (newObject != null) {
												ICompositeNode node = NodeModelUtils.getNode(newObject);
												if (node != null) {
													int offset = node.getOffset();
													getSourceViewer().revealRange(offset, 1);
// temporarily disabled:
//													StyledText text = getSourceViewer().getTextWidget();
//													text.setCaretOffset(offset);
//													text.setFocus();
												}
											}
										}
										return null;
									}
								});
							// update the properties view
							updatePropertiesView(mapToStructuredSelection(treeSelection));
						}
					} catch (Exception e) {
						LOGGER.error("selectionChanged() failed", e);
					}
				}
			};
		}
		
		private void updatePropertiesView(IStructuredSelection selection) {
			IWorkbench workbench = PlatformUI.getWorkbench();
			if (workbench == null) return;
			IWorkbenchWindow window = workbench.getActiveWorkbenchWindow();
			if (window == null) return;
			IWorkbenchPage page = window.getActivePage();
			if (page == null) return;
			PropertySheet propertiesView = (PropertySheet) page.findView(IPageLayout.ID_PROP_SHEET);
			if (propertiesView == null) return;
			
			propertiesView.partActivated(EFactoryWithTreeEditor.this);
			propertiesView.selectionChanged(EFactoryWithTreeEditor.this, selection);
		}
		
		private IStructuredSelection mapToStructuredSelection(ITreeSelection treeSelection) {
			Object object = treeSelection.getFirstElement();
			if (object instanceof EObject) {
				return buildStructuredSelection((EObject)object);
			}
			return new StructuredSelection();
		}

		private IStructuredSelection buildStructuredSelection(final EObject object) {
			if(object==null ){
				return new StructuredSelection();
			}
			final IItemPropertySource source = (IItemPropertySource) adapterFactory.adapt(object, IItemPropertySource.class);
			return new StructuredSelection() {
				public Object[] toArray() {
					return new Object[] { 
							new URIBasedPropertySource(object, source, document) {

							protected IPropertyDescriptor createPropertyDescriptor(final EObject eObject, IItemPropertyDescriptor itemPropertyDescriptor) {
								return new EFactoryPropertyDescriptor(eObject, itemPropertyDescriptor) {
										@Override
										protected CellEditor createEDataTypeCellEditor(final EDataType eDataType, Composite composite) {
											return new EFactoryEDataTypeCellEditor(eDataType, composite);
										}
										@Override
										public CellEditor createPropertyEditor(final Composite composite) {
											CellEditor editor = null;
											final Object feature = itemPropertyDescriptor.getFeature(this.object);
											if (feature instanceof EReference) {
												final EReference eReference = (EReference) feature;
												editor = new ExtendedDialogCellEditor(composite, getEditLabelProvider()) {
                                                    @Override @SuppressWarnings("unchecked")
													protected Object openDialogBox(Control cellEditorWindow) {
													Object currentEObjects = eObject.eGet(eReference);
													XtextEObjectSearchDialog dlg;
													if (eReference.isMany()) {
														dlg = new XtextMultiEObjectSearchDialog(composite.getShell(), eObjectSearch, globalDescriptionLabelProvider);
														((XtextMultiEObjectSearchDialog)dlg).setInitialSelection((List<EObject>) currentEObjects);
													} else {
														dlg = new XtextEObjectSearchDialog(composite.getShell(), eObjectSearch, globalDescriptionLabelProvider);
													}
													dlg.setInitialTypePattern(eReference.getEReferenceType().getName(), false);
													int status = dlg.open();
													if(status == Window.OK) {
														Object[] dlgResult = dlg.getResult();
														ArrayList<EObject> result = new ArrayList<EObject>();
														if (dlgResult != null) {
															for (Object eObjectDesc : dlgResult) {
																EObject eObject = ((IEObjectDescription)eObjectDesc).getEObjectOrProxy();
																// This is probably more of a work-around than a fix of the actual root cause :( but it works
																if (eObject != null && eObject.eIsProxy()) {
																	eObject = EcoreUtil.resolve(eObject, eReference.eResource());
																}
																result.add(eObject);
															}
														}
														if(eReference.isMany()) {
															return result;
														} else {
															return (result.size() > 0) ? result.get(0) : null;
														}
													} else {
														return currentEObjects;
													}
													}
												};
											} else {
												// return the default cell editor
												editor = super.createPropertyEditor(composite);
											}
											return editor;
										}
									};
								}
						}
					};
				}
			};
		}
		
		/**
		 * Finds the "real" (derived) current EObject, given the currently selected semantic object (e.g. EFactory/NewObject/Feature etc.)
		 */
		protected EObject getSelectedRealObject(EFactoryResource eFactoryResource, EObject semanticObject) throws ModelBuilderException {
			EObject selectedObject = null;
			if (semanticObject instanceof Feature) {
				Feature feature = (Feature)semanticObject;
				// Feature are contained in NewObject (see grammar), so this type cast is safe:
				NewObject container = (NewObject) feature.eContainer();
				if (feature.getEFeature() instanceof EAttribute) {
					// get the container of the feature so we can update properly the properties view
					selectedObject = eFactoryResource.getEFactoryEObject(container).orNull();
				}
				else if (feature.getEFeature() instanceof EReference) {
					EReference reference = (EReference)feature.getEFeature();
					// for now, consider only single references 
					if (!reference.isMany()) {
						selectedObject = eFactoryResource.getEFactoryEObject(container).orNull();
					}
				}
			} else if (semanticObject instanceof NewObject) {
				if (eFactoryResource.isBuilt())
					selectedObject = eFactoryResource.getEFactoryEObject((NewObject)semanticObject).orNull();
			}
			return selectedObject;
		}

		/**
		 * Called if getSelectedRealObject() couldn't find an appropriate "real" current EObject, and returns some functionally least-worst alternative.
		 * The current implementation of this fall back just returns the root NewObject of our model as selectedObject.
		 */
		protected EObject getFallbackSelectedRealObject(EFactoryResource eFactoryResource, EObject semanticObject) throws ModelBuilderException {
			Factory eFactoryFactory = eFactoryResource.getEFactoryFactory();
			if (eFactoryFactory == null)
				return null;
			NewObject rootNewObject = eFactoryFactory.getRoot();
			return eFactoryResource.getEFactoryEObject(rootNewObject).orNull();
		}

		
		public class EFactoryPropertyDescriptor extends PropertyDescriptor {
			
			public class EFactoryEDataTypeCellEditor extends PropertyDescriptor.EDataTypeCellEditor {
				public EFactoryEDataTypeCellEditor(EDataType eDataType, Composite parent) {
					super(eDataType, parent);
		     	    valueHandler = new EFactoryEDataTypeValueHandler(eDataType);
				    setValidator(valueHandler);
				}
			}
			
			protected class EFactoryEDataTypeValueHandler extends PropertyDescriptor.EDataTypeValueHandler {
				public EFactoryEDataTypeValueHandler(EDataType eDataType) {
					super(eDataType);
				}
				@Override
				public String toString(Object value) {
					if (value instanceof IItemPropertySource) {
						IItemPropertySource propertySource = (IItemPropertySource)value;
						return super.toString(propertySource.getEditableValue(value));
					}
					return super.toString(value);
				}			
			}
			
			@Override
			public CellEditor createPropertyEditor(Composite composite) {
				CellEditor editor = super.createPropertyEditor(composite);
				return editor;
			}

			public EFactoryPropertyDescriptor(Object object, IItemPropertyDescriptor itemPropertyDescriptor) {
				super(object, itemPropertyDescriptor);
			}
		}
		
		@Override
		public void dispose() {
			currentViewer.removeSelectionChangedListener(propertiesViewUpdater);
			if (adapterFactory != null) {
				adapterFactory.dispose();
			}
			editingDomain = null;
			propertiesViewUpdater = null;
			selectionViewer = null;
			currentViewer = null;
			super.dispose();
		}
		
		@Override
		public void init(IEditorSite site, IEditorInput input) throws PartInitException {
			super.init(site, input);
			IContextService contextService = (IContextService) getSite().getService(IContextService.class);
			if (contextService != null) {
				// This String constant is referenced in the plugin.xml
				contextService.activateContext("org.eclipse.emf.eson.ui.context");
			}
		}
		
	/**
	 * Maximize the child control of sashform passed.
	 * 
	 * @param control
	 *            - the child control of sashform to maximize or restore
	 */
	private void maximizeControl(Control control) {
		if (sashForm.getMaximizedControl() == control) {
			sashForm.setMaximizedControl(null);
		} else {
			sashForm.setMaximizedControl(control);
		}
	}

}
