/*
 * generated by Xtext
 */
package org.eclipse.emf.eson.ui.contentassist.antlr;

import java.util.Collection;
import java.util.Map;
import java.util.HashMap;

import org.antlr.runtime.RecognitionException;
import org.eclipse.xtext.AbstractElement;
import org.eclipse.xtext.ui.editor.contentassist.antlr.AbstractContentAssistParser;
import org.eclipse.xtext.ui.editor.contentassist.antlr.FollowElement;
import org.eclipse.xtext.ui.editor.contentassist.antlr.internal.AbstractInternalContentAssistParser;

import com.google.inject.Inject;

import org.eclipse.emf.eson.services.EFactoryGrammarAccess;

public class EFactoryParser extends AbstractContentAssistParser {
	
	@Inject
	private EFactoryGrammarAccess grammarAccess;
	
	private Map<AbstractElement, String> nameMappings;
	
	@Override
	protected org.eclipse.emf.eson.ui.contentassist.antlr.internal.InternalEFactoryParser createParser() {
		org.eclipse.emf.eson.ui.contentassist.antlr.internal.InternalEFactoryParser result = new org.eclipse.emf.eson.ui.contentassist.antlr.internal.InternalEFactoryParser(null);
		result.setGrammarAccess(grammarAccess);
		return result;
	}
	
	@Override
	protected String getRuleName(AbstractElement element) {
		if (nameMappings == null) {
			nameMappings = new HashMap<AbstractElement, String>() {
				private static final long serialVersionUID = 1L;
				{
					put(grammarAccess.getValueAccess().getAlternatives(), "rule__Value__Alternatives");
					put(grammarAccess.getAttributeAccess().getAlternatives(), "rule__Attribute__Alternatives");
					put(grammarAccess.getStringOrQualifiedNameAccess().getAlternatives(), "rule__StringOrQualifiedName__Alternatives");
					put(grammarAccess.getValidIDAccess().getAlternatives(), "rule__ValidID__Alternatives");
					put(grammarAccess.getBooleanAccess().getAlternatives(), "rule__Boolean__Alternatives");
					put(grammarAccess.getFactoryAccess().getGroup(), "rule__Factory__Group__0");
					put(grammarAccess.getPackageImportAccess().getGroup(), "rule__PackageImport__Group__0");
					put(grammarAccess.getNamespaceImportAccess().getGroup(), "rule__NamespaceImport__Group__0");
					put(grammarAccess.getCustomNameMappingAccess().getGroup(), "rule__CustomNameMapping__Group__0");
					put(grammarAccess.getFeatureAccess().getGroup(), "rule__Feature__Group__0");
					put(grammarAccess.getNewObjectAccess().getGroup(), "rule__NewObject__Group__0");
					put(grammarAccess.getValueAccess().getGroup_2(), "rule__Value__Group_2__0");
					put(grammarAccess.getValueAccess().getGroup_2_0(), "rule__Value__Group_2_0__0");
					put(grammarAccess.getValueAccess().getGroup_2_0_0(), "rule__Value__Group_2_0_0__0");
					put(grammarAccess.getMultiValueAccess().getGroup(), "rule__MultiValue__Group__0");
					put(grammarAccess.getEnumAttributeAccess().getGroup(), "rule__EnumAttribute__Group__0");
					put(grammarAccess.getQualifiedNameWithWildcardAccess().getGroup(), "rule__QualifiedNameWithWildcard__Group__0");
					put(grammarAccess.getQualifiedNameAccess().getGroup(), "rule__QualifiedName__Group__0");
					put(grammarAccess.getQualifiedNameAccess().getGroup_1(), "rule__QualifiedName__Group_1__0");
					put(grammarAccess.getLongAccess().getGroup(), "rule__Long__Group__0");
					put(grammarAccess.getDoubleAccess().getGroup(), "rule__Double__Group__0");
					put(grammarAccess.getDateAccess().getGroup(), "rule__Date__Group__0");
					put(grammarAccess.getFactoryAccess().getImportsAssignment_0(), "rule__Factory__ImportsAssignment_0");
					put(grammarAccess.getFactoryAccess().getEpackagesAssignment_1(), "rule__Factory__EpackagesAssignment_1");
					put(grammarAccess.getFactoryAccess().getAnnotationsAssignment_2(), "rule__Factory__AnnotationsAssignment_2");
					put(grammarAccess.getFactoryAccess().getRootAssignment_3(), "rule__Factory__RootAssignment_3");
					put(grammarAccess.getPackageImportAccess().getEPackageAssignment_1(), "rule__PackageImport__EPackageAssignment_1");
					put(grammarAccess.getNamespaceImportAccess().getImportedNamespaceAssignment_1(), "rule__NamespaceImport__ImportedNamespaceAssignment_1");
					put(grammarAccess.getCustomNameMappingAccess().getEClassAssignment_2(), "rule__CustomNameMapping__EClassAssignment_2");
					put(grammarAccess.getCustomNameMappingAccess().getNameFeatureAssignment_4(), "rule__CustomNameMapping__NameFeatureAssignment_4");
					put(grammarAccess.getFeatureAccess().getEFeatureAssignment_0(), "rule__Feature__EFeatureAssignment_0");
					put(grammarAccess.getFeatureAccess().getValueAssignment_2(), "rule__Feature__ValueAssignment_2");
					put(grammarAccess.getNewObjectAccess().getEClassAssignment_0(), "rule__NewObject__EClassAssignment_0");
					put(grammarAccess.getNewObjectAccess().getNameAssignment_1(), "rule__NewObject__NameAssignment_1");
					put(grammarAccess.getNewObjectAccess().getFeaturesAssignment_3(), "rule__NewObject__FeaturesAssignment_3");
					put(grammarAccess.getValueAccess().getEClassAssignment_2_0_0_1(), "rule__Value__EClassAssignment_2_0_0_1");
					put(grammarAccess.getValueAccess().getNameAssignment_2_0_0_2(), "rule__Value__NameAssignment_2_0_0_2");
					put(grammarAccess.getValueAccess().getFeaturesAssignment_2_1(), "rule__Value__FeaturesAssignment_2_1");
					put(grammarAccess.getMultiValueAccess().getValuesAssignment_2(), "rule__MultiValue__ValuesAssignment_2");
					put(grammarAccess.getReferenceAccess().getValueAssignment(), "rule__Reference__ValueAssignment");
					put(grammarAccess.getEnumAttributeAccess().getValueAssignment_1(), "rule__EnumAttribute__ValueAssignment_1");
					put(grammarAccess.getStringAttributeAccess().getValueAssignment(), "rule__StringAttribute__ValueAssignment");
					put(grammarAccess.getIntegerAttributeAccess().getValueAssignment(), "rule__IntegerAttribute__ValueAssignment");
					put(grammarAccess.getDoubleAttributeAccess().getValueAssignment(), "rule__DoubleAttribute__ValueAssignment");
					put(grammarAccess.getDateAttributeAccess().getValueAssignment(), "rule__DateAttribute__ValueAssignment");
					put(grammarAccess.getNullAttributeAccess().getValueAssignment(), "rule__NullAttribute__ValueAssignment");
					put(grammarAccess.getBooleanAttributeAccess().getValueAssignment(), "rule__BooleanAttribute__ValueAssignment");
				}
			};
		}
		return nameMappings.get(element);
	}
	
	@Override
	protected Collection<FollowElement> getFollowElements(AbstractInternalContentAssistParser parser) {
		try {
			org.eclipse.emf.eson.ui.contentassist.antlr.internal.InternalEFactoryParser typedParser = (org.eclipse.emf.eson.ui.contentassist.antlr.internal.InternalEFactoryParser) parser;
			typedParser.entryRuleFactory();
			return typedParser.getFollowElements();
		} catch(RecognitionException ex) {
			throw new RuntimeException(ex);
		}		
	}
	
	@Override
	protected String[] getInitialHiddenTokens() {
		return new String[] { "RULE_WS", "RULE_ML_COMMENT", "RULE_SL_COMMENT" };
	}
	
	public EFactoryGrammarAccess getGrammarAccess() {
		return this.grammarAccess;
	}
	
	public void setGrammarAccess(EFactoryGrammarAccess grammarAccess) {
		this.grammarAccess = grammarAccess;
	}
}
