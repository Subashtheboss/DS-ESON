/*
 * generated by Xtext
 */
package org.eclipse.emf.eson.validation;
 
import java.util.ArrayList;
import java.util.List;

import org.eclipse.emf.ecore.EPackage;

public class AbstractEFactoryJavaValidator extends org.eclipse.xtext.validation.AbstractDeclarativeValidator {

	@Override
	protected List<EPackage> getEPackages() {
	    List<EPackage> result = new ArrayList<EPackage>();
	    result.add(org.eclipse.emf.eson.eFactory.EFactoryPackage.eINSTANCE);
		return result;
	}

}
