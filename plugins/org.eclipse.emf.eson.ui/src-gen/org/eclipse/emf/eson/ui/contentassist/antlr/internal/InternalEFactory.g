/*
* generated by Xtext
*/
grammar InternalEFactory;

options {
	superClass=AbstractInternalContentAssistParser;
	backtrack=true;
	
}

@lexer::header {
package org.eclipse.emf.eson.ui.contentassist.antlr.internal;

// Hack: Use our own Lexer superclass by means of import. 
// Currently there is no other way to specify the superclass for the lexer.
import org.eclipse.xtext.ui.editor.contentassist.antlr.internal.Lexer;
}

@parser::header {
package org.eclipse.emf.eson.ui.contentassist.antlr.internal; 

import java.io.InputStream;
import org.eclipse.xtext.*;
import org.eclipse.xtext.parser.*;
import org.eclipse.xtext.parser.impl.*;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.ui.editor.contentassist.antlr.internal.AbstractInternalContentAssistParser;
import org.eclipse.xtext.ui.editor.contentassist.antlr.internal.DFA;
import org.eclipse.emf.eson.services.EFactoryGrammarAccess;

}

@parser::members {
 
 	private EFactoryGrammarAccess grammarAccess;
 	
    public void setGrammarAccess(EFactoryGrammarAccess grammarAccess) {
    	this.grammarAccess = grammarAccess;
    }
    
    @Override
    protected Grammar getGrammar() {
    	return grammarAccess.getGrammar();
    }
    
    @Override
    protected String getValueForTokenName(String tokenName) {
    	return tokenName;
    }

}




// Entry rule entryRuleFactory
entryRuleFactory 
:
{ before(grammarAccess.getFactoryRule()); }
	 ruleFactory
{ after(grammarAccess.getFactoryRule()); } 
	 EOF 
;

// Rule Factory
ruleFactory
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getFactoryAccess().getGroup()); }
(rule__Factory__Group__0)
{ after(grammarAccess.getFactoryAccess().getGroup()); }
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRulePackageImport
entryRulePackageImport 
:
{ before(grammarAccess.getPackageImportRule()); }
	 rulePackageImport
{ after(grammarAccess.getPackageImportRule()); } 
	 EOF 
;

// Rule PackageImport
rulePackageImport
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getPackageImportAccess().getGroup()); }
(rule__PackageImport__Group__0)
{ after(grammarAccess.getPackageImportAccess().getGroup()); }
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleAnnotation
entryRuleAnnotation 
:
{ before(grammarAccess.getAnnotationRule()); }
	 ruleAnnotation
{ after(grammarAccess.getAnnotationRule()); } 
	 EOF 
;

// Rule Annotation
ruleAnnotation
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getAnnotationAccess().getCustomNameMappingParserRuleCall()); }
	ruleCustomNameMapping
{ after(grammarAccess.getAnnotationAccess().getCustomNameMappingParserRuleCall()); }
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleCustomNameMapping
entryRuleCustomNameMapping 
:
{ before(grammarAccess.getCustomNameMappingRule()); }
	 ruleCustomNameMapping
{ after(grammarAccess.getCustomNameMappingRule()); } 
	 EOF 
;

// Rule CustomNameMapping
ruleCustomNameMapping
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getCustomNameMappingAccess().getGroup()); }
(rule__CustomNameMapping__Group__0)
{ after(grammarAccess.getCustomNameMappingAccess().getGroup()); }
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleFeature
entryRuleFeature 
:
{ before(grammarAccess.getFeatureRule()); }
	 ruleFeature
{ after(grammarAccess.getFeatureRule()); } 
	 EOF 
;

// Rule Feature
ruleFeature
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getFeatureAccess().getGroup()); }
(rule__Feature__Group__0)
{ after(grammarAccess.getFeatureAccess().getGroup()); }
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleNewObject
entryRuleNewObject 
:
{ before(grammarAccess.getNewObjectRule()); }
	 ruleNewObject
{ after(grammarAccess.getNewObjectRule()); } 
	 EOF 
;

// Rule NewObject
ruleNewObject
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getNewObjectAccess().getGroup()); }
(rule__NewObject__Group__0)
{ after(grammarAccess.getNewObjectAccess().getGroup()); }
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleValue
entryRuleValue 
:
{ before(grammarAccess.getValueRule()); }
	 ruleValue
{ after(grammarAccess.getValueRule()); } 
	 EOF 
;

// Rule Value
ruleValue
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getValueAccess().getAlternatives()); }
(rule__Value__Alternatives)
{ after(grammarAccess.getValueAccess().getAlternatives()); }
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleMultiValue
entryRuleMultiValue 
:
{ before(grammarAccess.getMultiValueRule()); }
	 ruleMultiValue
{ after(grammarAccess.getMultiValueRule()); } 
	 EOF 
;

// Rule MultiValue
ruleMultiValue
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getMultiValueAccess().getGroup()); }
(rule__MultiValue__Group__0)
{ after(grammarAccess.getMultiValueAccess().getGroup()); }
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleReference
entryRuleReference 
:
{ before(grammarAccess.getReferenceRule()); }
	 ruleReference
{ after(grammarAccess.getReferenceRule()); } 
	 EOF 
;

// Rule Reference
ruleReference
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getReferenceAccess().getValueAssignment()); }
(rule__Reference__ValueAssignment)
{ after(grammarAccess.getReferenceAccess().getValueAssignment()); }
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleContainment
entryRuleContainment 
:
{ before(grammarAccess.getContainmentRule()); }
	 ruleContainment
{ after(grammarAccess.getContainmentRule()); } 
	 EOF 
;

// Rule Containment
ruleContainment
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getContainmentAccess().getValueAssignment()); }
(rule__Containment__ValueAssignment)
{ after(grammarAccess.getContainmentAccess().getValueAssignment()); }
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleAttribute
entryRuleAttribute 
:
{ before(grammarAccess.getAttributeRule()); }
	 ruleAttribute
{ after(grammarAccess.getAttributeRule()); } 
	 EOF 
;

// Rule Attribute
ruleAttribute
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getAttributeAccess().getAlternatives()); }
(rule__Attribute__Alternatives)
{ after(grammarAccess.getAttributeAccess().getAlternatives()); }
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleEnumAttribute
entryRuleEnumAttribute 
:
{ before(grammarAccess.getEnumAttributeRule()); }
	 ruleEnumAttribute
{ after(grammarAccess.getEnumAttributeRule()); } 
	 EOF 
;

// Rule EnumAttribute
ruleEnumAttribute
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getEnumAttributeAccess().getGroup()); }
(rule__EnumAttribute__Group__0)
{ after(grammarAccess.getEnumAttributeAccess().getGroup()); }
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleStringAttribute
entryRuleStringAttribute 
:
{ before(grammarAccess.getStringAttributeRule()); }
	 ruleStringAttribute
{ after(grammarAccess.getStringAttributeRule()); } 
	 EOF 
;

// Rule StringAttribute
ruleStringAttribute
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getStringAttributeAccess().getValueAssignment()); }
(rule__StringAttribute__ValueAssignment)
{ after(grammarAccess.getStringAttributeAccess().getValueAssignment()); }
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleIntegerAttribute
entryRuleIntegerAttribute 
:
{ before(grammarAccess.getIntegerAttributeRule()); }
	 ruleIntegerAttribute
{ after(grammarAccess.getIntegerAttributeRule()); } 
	 EOF 
;

// Rule IntegerAttribute
ruleIntegerAttribute
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getIntegerAttributeAccess().getValueAssignment()); }
(rule__IntegerAttribute__ValueAssignment)
{ after(grammarAccess.getIntegerAttributeAccess().getValueAssignment()); }
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleDoubleAttribute
entryRuleDoubleAttribute 
:
{ before(grammarAccess.getDoubleAttributeRule()); }
	 ruleDoubleAttribute
{ after(grammarAccess.getDoubleAttributeRule()); } 
	 EOF 
;

// Rule DoubleAttribute
ruleDoubleAttribute
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getDoubleAttributeAccess().getValueAssignment()); }
(rule__DoubleAttribute__ValueAssignment)
{ after(grammarAccess.getDoubleAttributeAccess().getValueAssignment()); }
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleDateAttribute
entryRuleDateAttribute 
:
{ before(grammarAccess.getDateAttributeRule()); }
	 ruleDateAttribute
{ after(grammarAccess.getDateAttributeRule()); } 
	 EOF 
;

// Rule DateAttribute
ruleDateAttribute
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getDateAttributeAccess().getValueAssignment()); }
(rule__DateAttribute__ValueAssignment)
{ after(grammarAccess.getDateAttributeAccess().getValueAssignment()); }
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleNullAttribute
entryRuleNullAttribute 
:
{ before(grammarAccess.getNullAttributeRule()); }
	 ruleNullAttribute
{ after(grammarAccess.getNullAttributeRule()); } 
	 EOF 
;

// Rule NullAttribute
ruleNullAttribute
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getNullAttributeAccess().getValueAssignment()); }
(rule__NullAttribute__ValueAssignment)
{ after(grammarAccess.getNullAttributeAccess().getValueAssignment()); }
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleBooleanAttribute
entryRuleBooleanAttribute 
:
{ before(grammarAccess.getBooleanAttributeRule()); }
	 ruleBooleanAttribute
{ after(grammarAccess.getBooleanAttributeRule()); } 
	 EOF 
;

// Rule BooleanAttribute
ruleBooleanAttribute
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getBooleanAttributeAccess().getValueAssignment()); }
(rule__BooleanAttribute__ValueAssignment)
{ after(grammarAccess.getBooleanAttributeAccess().getValueAssignment()); }
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleQualifiedName
entryRuleQualifiedName 
:
{ before(grammarAccess.getQualifiedNameRule()); }
	 ruleQualifiedName
{ after(grammarAccess.getQualifiedNameRule()); } 
	 EOF 
;

// Rule QualifiedName
ruleQualifiedName
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getQualifiedNameAccess().getGroup()); }
(rule__QualifiedName__Group__0)
{ after(grammarAccess.getQualifiedNameAccess().getGroup()); }
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleValidID
entryRuleValidID 
:
{ before(grammarAccess.getValidIDRule()); }
	 ruleValidID
{ after(grammarAccess.getValidIDRule()); } 
	 EOF 
;

// Rule ValidID
ruleValidID
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getValidIDAccess().getIDTerminalRuleCall()); }
	RULE_ID
{ after(grammarAccess.getValidIDAccess().getIDTerminalRuleCall()); }
)

;
finally {
	restoreStackSize(stackSize);
}




rule__Value__Alternatives
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getValueAccess().getMultiValueParserRuleCall_0()); }
	ruleMultiValue
{ after(grammarAccess.getValueAccess().getMultiValueParserRuleCall_0()); }
)

    |(
{ before(grammarAccess.getValueAccess().getAttributeParserRuleCall_1()); }
	ruleAttribute
{ after(grammarAccess.getValueAccess().getAttributeParserRuleCall_1()); }
)

    |(
{ before(grammarAccess.getValueAccess().getContainmentParserRuleCall_2()); }
(	ruleContainment)
{ after(grammarAccess.getValueAccess().getContainmentParserRuleCall_2()); }
)

    |(
{ before(grammarAccess.getValueAccess().getReferenceParserRuleCall_3()); }
(	ruleReference)
{ after(grammarAccess.getValueAccess().getReferenceParserRuleCall_3()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__Attribute__Alternatives
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getAttributeAccess().getEnumAttributeParserRuleCall_0()); }
	ruleEnumAttribute
{ after(grammarAccess.getAttributeAccess().getEnumAttributeParserRuleCall_0()); }
)

    |(
{ before(grammarAccess.getAttributeAccess().getStringAttributeParserRuleCall_1()); }
	ruleStringAttribute
{ after(grammarAccess.getAttributeAccess().getStringAttributeParserRuleCall_1()); }
)

    |(
{ before(grammarAccess.getAttributeAccess().getIntegerAttributeParserRuleCall_2()); }
	ruleIntegerAttribute
{ after(grammarAccess.getAttributeAccess().getIntegerAttributeParserRuleCall_2()); }
)

    |(
{ before(grammarAccess.getAttributeAccess().getBooleanAttributeParserRuleCall_3()); }
	ruleBooleanAttribute
{ after(grammarAccess.getAttributeAccess().getBooleanAttributeParserRuleCall_3()); }
)

    |(
{ before(grammarAccess.getAttributeAccess().getDoubleAttributeParserRuleCall_4()); }
	ruleDoubleAttribute
{ after(grammarAccess.getAttributeAccess().getDoubleAttributeParserRuleCall_4()); }
)

    |(
{ before(grammarAccess.getAttributeAccess().getDateAttributeParserRuleCall_5()); }
	ruleDateAttribute
{ after(grammarAccess.getAttributeAccess().getDateAttributeParserRuleCall_5()); }
)

    |(
{ before(grammarAccess.getAttributeAccess().getNullAttributeParserRuleCall_6()); }
	ruleNullAttribute
{ after(grammarAccess.getAttributeAccess().getNullAttributeParserRuleCall_6()); }
)

;
finally {
	restoreStackSize(stackSize);
}



rule__Factory__Group__0
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__Factory__Group__0__Impl
	rule__Factory__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Factory__Group__0__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getFactoryAccess().getEpackagesAssignment_0()); }
(rule__Factory__EpackagesAssignment_0)*
{ after(grammarAccess.getFactoryAccess().getEpackagesAssignment_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__Factory__Group__1
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__Factory__Group__1__Impl
	rule__Factory__Group__2
;
finally {
	restoreStackSize(stackSize);
}

rule__Factory__Group__1__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getFactoryAccess().getAnnotationsAssignment_1()); }
(rule__Factory__AnnotationsAssignment_1)*
{ after(grammarAccess.getFactoryAccess().getAnnotationsAssignment_1()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__Factory__Group__2
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__Factory__Group__2__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Factory__Group__2__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getFactoryAccess().getRootAssignment_2()); }
(rule__Factory__RootAssignment_2)
{ after(grammarAccess.getFactoryAccess().getRootAssignment_2()); }
)

;
finally {
	restoreStackSize(stackSize);
}








rule__PackageImport__Group__0
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__PackageImport__Group__0__Impl
	rule__PackageImport__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__PackageImport__Group__0__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getPackageImportAccess().getUseKeyword_0()); }

	'use' 

{ after(grammarAccess.getPackageImportAccess().getUseKeyword_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__PackageImport__Group__1
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__PackageImport__Group__1__Impl
	rule__PackageImport__Group__2
;
finally {
	restoreStackSize(stackSize);
}

rule__PackageImport__Group__1__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getPackageImportAccess().getEPackageAssignment_1()); }
(rule__PackageImport__EPackageAssignment_1)
{ after(grammarAccess.getPackageImportAccess().getEPackageAssignment_1()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__PackageImport__Group__2
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__PackageImport__Group__2__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__PackageImport__Group__2__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getPackageImportAccess().getFullStopAsteriskKeyword_2()); }

	'.*' 

{ after(grammarAccess.getPackageImportAccess().getFullStopAsteriskKeyword_2()); }
)

;
finally {
	restoreStackSize(stackSize);
}








rule__CustomNameMapping__Group__0
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__CustomNameMapping__Group__0__Impl
	rule__CustomNameMapping__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__CustomNameMapping__Group__0__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getCustomNameMappingAccess().getNameKeyword_0()); }

	'@Name' 

{ after(grammarAccess.getCustomNameMappingAccess().getNameKeyword_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__CustomNameMapping__Group__1
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__CustomNameMapping__Group__1__Impl
	rule__CustomNameMapping__Group__2
;
finally {
	restoreStackSize(stackSize);
}

rule__CustomNameMapping__Group__1__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getCustomNameMappingAccess().getLeftCurlyBracketKeyword_1()); }

	'{' 

{ after(grammarAccess.getCustomNameMappingAccess().getLeftCurlyBracketKeyword_1()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__CustomNameMapping__Group__2
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__CustomNameMapping__Group__2__Impl
	rule__CustomNameMapping__Group__3
;
finally {
	restoreStackSize(stackSize);
}

rule__CustomNameMapping__Group__2__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getCustomNameMappingAccess().getEClassAssignment_2()); }
(rule__CustomNameMapping__EClassAssignment_2)
{ after(grammarAccess.getCustomNameMappingAccess().getEClassAssignment_2()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__CustomNameMapping__Group__3
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__CustomNameMapping__Group__3__Impl
	rule__CustomNameMapping__Group__4
;
finally {
	restoreStackSize(stackSize);
}

rule__CustomNameMapping__Group__3__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getCustomNameMappingAccess().getEqualsSignKeyword_3()); }

	'=' 

{ after(grammarAccess.getCustomNameMappingAccess().getEqualsSignKeyword_3()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__CustomNameMapping__Group__4
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__CustomNameMapping__Group__4__Impl
	rule__CustomNameMapping__Group__5
;
finally {
	restoreStackSize(stackSize);
}

rule__CustomNameMapping__Group__4__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getCustomNameMappingAccess().getNameFeatureAssignment_4()); }
(rule__CustomNameMapping__NameFeatureAssignment_4)
{ after(grammarAccess.getCustomNameMappingAccess().getNameFeatureAssignment_4()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__CustomNameMapping__Group__5
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__CustomNameMapping__Group__5__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__CustomNameMapping__Group__5__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getCustomNameMappingAccess().getRightCurlyBracketKeyword_5()); }

	'}' 

{ after(grammarAccess.getCustomNameMappingAccess().getRightCurlyBracketKeyword_5()); }
)

;
finally {
	restoreStackSize(stackSize);
}














rule__Feature__Group__0
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__Feature__Group__0__Impl
	rule__Feature__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Feature__Group__0__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getFeatureAccess().getEFeatureAssignment_0()); }
(rule__Feature__EFeatureAssignment_0)
{ after(grammarAccess.getFeatureAccess().getEFeatureAssignment_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__Feature__Group__1
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__Feature__Group__1__Impl
	rule__Feature__Group__2
;
finally {
	restoreStackSize(stackSize);
}

rule__Feature__Group__1__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getFeatureAccess().getColonKeyword_1()); }

	':' 

{ after(grammarAccess.getFeatureAccess().getColonKeyword_1()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__Feature__Group__2
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__Feature__Group__2__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Feature__Group__2__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getFeatureAccess().getValueAssignment_2()); }
(rule__Feature__ValueAssignment_2)?
{ after(grammarAccess.getFeatureAccess().getValueAssignment_2()); }
)

;
finally {
	restoreStackSize(stackSize);
}








rule__NewObject__Group__0
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__NewObject__Group__0__Impl
	rule__NewObject__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__NewObject__Group__0__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getNewObjectAccess().getEClassAssignment_0()); }
(rule__NewObject__EClassAssignment_0)
{ after(grammarAccess.getNewObjectAccess().getEClassAssignment_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__NewObject__Group__1
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__NewObject__Group__1__Impl
	rule__NewObject__Group__2
;
finally {
	restoreStackSize(stackSize);
}

rule__NewObject__Group__1__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getNewObjectAccess().getNameAssignment_1()); }
(rule__NewObject__NameAssignment_1)?
{ after(grammarAccess.getNewObjectAccess().getNameAssignment_1()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__NewObject__Group__2
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__NewObject__Group__2__Impl
	rule__NewObject__Group__3
;
finally {
	restoreStackSize(stackSize);
}

rule__NewObject__Group__2__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getNewObjectAccess().getLeftCurlyBracketKeyword_2()); }

	'{' 

{ after(grammarAccess.getNewObjectAccess().getLeftCurlyBracketKeyword_2()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__NewObject__Group__3
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__NewObject__Group__3__Impl
	rule__NewObject__Group__4
;
finally {
	restoreStackSize(stackSize);
}

rule__NewObject__Group__3__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getNewObjectAccess().getFeaturesAssignment_3()); }
(rule__NewObject__FeaturesAssignment_3)*
{ after(grammarAccess.getNewObjectAccess().getFeaturesAssignment_3()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__NewObject__Group__4
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__NewObject__Group__4__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__NewObject__Group__4__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getNewObjectAccess().getRightCurlyBracketKeyword_4()); }

	'}' 

{ after(grammarAccess.getNewObjectAccess().getRightCurlyBracketKeyword_4()); }
)

;
finally {
	restoreStackSize(stackSize);
}












rule__MultiValue__Group__0
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__MultiValue__Group__0__Impl
	rule__MultiValue__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__MultiValue__Group__0__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getMultiValueAccess().getMultiValueAction_0()); }
(

)
{ after(grammarAccess.getMultiValueAccess().getMultiValueAction_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__MultiValue__Group__1
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__MultiValue__Group__1__Impl
	rule__MultiValue__Group__2
;
finally {
	restoreStackSize(stackSize);
}

rule__MultiValue__Group__1__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getMultiValueAccess().getLeftSquareBracketKeyword_1()); }

	'[' 

{ after(grammarAccess.getMultiValueAccess().getLeftSquareBracketKeyword_1()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__MultiValue__Group__2
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__MultiValue__Group__2__Impl
	rule__MultiValue__Group__3
;
finally {
	restoreStackSize(stackSize);
}

rule__MultiValue__Group__2__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getMultiValueAccess().getValuesAssignment_2()); }
(rule__MultiValue__ValuesAssignment_2)*
{ after(grammarAccess.getMultiValueAccess().getValuesAssignment_2()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__MultiValue__Group__3
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__MultiValue__Group__3__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__MultiValue__Group__3__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getMultiValueAccess().getRightSquareBracketKeyword_3()); }

	']' 

{ after(grammarAccess.getMultiValueAccess().getRightSquareBracketKeyword_3()); }
)

;
finally {
	restoreStackSize(stackSize);
}










rule__EnumAttribute__Group__0
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__EnumAttribute__Group__0__Impl
	rule__EnumAttribute__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__EnumAttribute__Group__0__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getEnumAttributeAccess().getColonKeyword_0()); }

	':' 

{ after(grammarAccess.getEnumAttributeAccess().getColonKeyword_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__EnumAttribute__Group__1
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__EnumAttribute__Group__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__EnumAttribute__Group__1__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getEnumAttributeAccess().getValueAssignment_1()); }
(rule__EnumAttribute__ValueAssignment_1)
{ after(grammarAccess.getEnumAttributeAccess().getValueAssignment_1()); }
)

;
finally {
	restoreStackSize(stackSize);
}






rule__QualifiedName__Group__0
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__QualifiedName__Group__0__Impl
	rule__QualifiedName__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__QualifiedName__Group__0__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getQualifiedNameAccess().getValidIDParserRuleCall_0()); }
	ruleValidID
{ after(grammarAccess.getQualifiedNameAccess().getValidIDParserRuleCall_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__QualifiedName__Group__1
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__QualifiedName__Group__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__QualifiedName__Group__1__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getQualifiedNameAccess().getGroup_1()); }
(rule__QualifiedName__Group_1__0)*
{ after(grammarAccess.getQualifiedNameAccess().getGroup_1()); }
)

;
finally {
	restoreStackSize(stackSize);
}






rule__QualifiedName__Group_1__0
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__QualifiedName__Group_1__0__Impl
	rule__QualifiedName__Group_1__1
;
finally {
	restoreStackSize(stackSize);
}

rule__QualifiedName__Group_1__0__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getQualifiedNameAccess().getFullStopKeyword_1_0()); }
(
	'.' 
)
{ after(grammarAccess.getQualifiedNameAccess().getFullStopKeyword_1_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__QualifiedName__Group_1__1
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__QualifiedName__Group_1__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__QualifiedName__Group_1__1__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getQualifiedNameAccess().getValidIDParserRuleCall_1_1()); }
	ruleValidID
{ after(grammarAccess.getQualifiedNameAccess().getValidIDParserRuleCall_1_1()); }
)

;
finally {
	restoreStackSize(stackSize);
}







rule__Factory__EpackagesAssignment_0
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getFactoryAccess().getEpackagesPackageImportParserRuleCall_0_0()); }
	rulePackageImport{ after(grammarAccess.getFactoryAccess().getEpackagesPackageImportParserRuleCall_0_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__Factory__AnnotationsAssignment_1
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getFactoryAccess().getAnnotationsAnnotationParserRuleCall_1_0()); }
	ruleAnnotation{ after(grammarAccess.getFactoryAccess().getAnnotationsAnnotationParserRuleCall_1_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__Factory__RootAssignment_2
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getFactoryAccess().getRootNewObjectParserRuleCall_2_0()); }
	ruleNewObject{ after(grammarAccess.getFactoryAccess().getRootNewObjectParserRuleCall_2_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__PackageImport__EPackageAssignment_1
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getPackageImportAccess().getEPackageEPackageCrossReference_1_0()); }
(
{ before(grammarAccess.getPackageImportAccess().getEPackageEPackageQualifiedNameParserRuleCall_1_0_1()); }
	ruleQualifiedName{ after(grammarAccess.getPackageImportAccess().getEPackageEPackageQualifiedNameParserRuleCall_1_0_1()); }
)
{ after(grammarAccess.getPackageImportAccess().getEPackageEPackageCrossReference_1_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__CustomNameMapping__EClassAssignment_2
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getCustomNameMappingAccess().getEClassEClassCrossReference_2_0()); }
(
{ before(grammarAccess.getCustomNameMappingAccess().getEClassEClassQualifiedNameParserRuleCall_2_0_1()); }
	ruleQualifiedName{ after(grammarAccess.getCustomNameMappingAccess().getEClassEClassQualifiedNameParserRuleCall_2_0_1()); }
)
{ after(grammarAccess.getCustomNameMappingAccess().getEClassEClassCrossReference_2_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__CustomNameMapping__NameFeatureAssignment_4
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getCustomNameMappingAccess().getNameFeatureEAttributeCrossReference_4_0()); }
(
{ before(grammarAccess.getCustomNameMappingAccess().getNameFeatureEAttributeIDTerminalRuleCall_4_0_1()); }
	RULE_ID{ after(grammarAccess.getCustomNameMappingAccess().getNameFeatureEAttributeIDTerminalRuleCall_4_0_1()); }
)
{ after(grammarAccess.getCustomNameMappingAccess().getNameFeatureEAttributeCrossReference_4_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__Feature__EFeatureAssignment_0
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getFeatureAccess().getEFeatureEStructuralFeatureCrossReference_0_0()); }
(
{ before(grammarAccess.getFeatureAccess().getEFeatureEStructuralFeatureIDTerminalRuleCall_0_0_1()); }
	RULE_ID{ after(grammarAccess.getFeatureAccess().getEFeatureEStructuralFeatureIDTerminalRuleCall_0_0_1()); }
)
{ after(grammarAccess.getFeatureAccess().getEFeatureEStructuralFeatureCrossReference_0_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__Feature__ValueAssignment_2
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getFeatureAccess().getValueValueParserRuleCall_2_0()); }
	ruleValue{ after(grammarAccess.getFeatureAccess().getValueValueParserRuleCall_2_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__NewObject__EClassAssignment_0
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getNewObjectAccess().getEClassEClassCrossReference_0_0()); }
(
{ before(grammarAccess.getNewObjectAccess().getEClassEClassQualifiedNameParserRuleCall_0_0_1()); }
	ruleQualifiedName{ after(grammarAccess.getNewObjectAccess().getEClassEClassQualifiedNameParserRuleCall_0_0_1()); }
)
{ after(grammarAccess.getNewObjectAccess().getEClassEClassCrossReference_0_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__NewObject__NameAssignment_1
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getNewObjectAccess().getNameIDTerminalRuleCall_1_0()); }
	RULE_ID{ after(grammarAccess.getNewObjectAccess().getNameIDTerminalRuleCall_1_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__NewObject__FeaturesAssignment_3
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getNewObjectAccess().getFeaturesFeatureParserRuleCall_3_0()); }
	ruleFeature{ after(grammarAccess.getNewObjectAccess().getFeaturesFeatureParserRuleCall_3_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__MultiValue__ValuesAssignment_2
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getMultiValueAccess().getValuesValueParserRuleCall_2_0()); }
	ruleValue{ after(grammarAccess.getMultiValueAccess().getValuesValueParserRuleCall_2_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__Reference__ValueAssignment
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getReferenceAccess().getValueEObjectCrossReference_0()); }
(
{ before(grammarAccess.getReferenceAccess().getValueEObjectQualifiedNameParserRuleCall_0_1()); }
	ruleQualifiedName{ after(grammarAccess.getReferenceAccess().getValueEObjectQualifiedNameParserRuleCall_0_1()); }
)
{ after(grammarAccess.getReferenceAccess().getValueEObjectCrossReference_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__Containment__ValueAssignment
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getContainmentAccess().getValueNewObjectParserRuleCall_0()); }
	ruleNewObject{ after(grammarAccess.getContainmentAccess().getValueNewObjectParserRuleCall_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__EnumAttribute__ValueAssignment_1
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getEnumAttributeAccess().getValueEEnumLiteralCrossReference_1_0()); }
(
{ before(grammarAccess.getEnumAttributeAccess().getValueEEnumLiteralIDTerminalRuleCall_1_0_1()); }
	RULE_ID{ after(grammarAccess.getEnumAttributeAccess().getValueEEnumLiteralIDTerminalRuleCall_1_0_1()); }
)
{ after(grammarAccess.getEnumAttributeAccess().getValueEEnumLiteralCrossReference_1_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__StringAttribute__ValueAssignment
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getStringAttributeAccess().getValueSTRINGTerminalRuleCall_0()); }
	RULE_STRING{ after(grammarAccess.getStringAttributeAccess().getValueSTRINGTerminalRuleCall_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__IntegerAttribute__ValueAssignment
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getIntegerAttributeAccess().getValueLONGTerminalRuleCall_0()); }
	RULE_LONG{ after(grammarAccess.getIntegerAttributeAccess().getValueLONGTerminalRuleCall_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__DoubleAttribute__ValueAssignment
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getDoubleAttributeAccess().getValueDOUBLETerminalRuleCall_0()); }
	RULE_DOUBLE{ after(grammarAccess.getDoubleAttributeAccess().getValueDOUBLETerminalRuleCall_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__DateAttribute__ValueAssignment
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getDateAttributeAccess().getValueDATETerminalRuleCall_0()); }
	RULE_DATE{ after(grammarAccess.getDateAttributeAccess().getValueDATETerminalRuleCall_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__NullAttribute__ValueAssignment
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getNullAttributeAccess().getValueNULLKeyword_0()); }
(
{ before(grammarAccess.getNullAttributeAccess().getValueNULLKeyword_0()); }

	'NULL' 

{ after(grammarAccess.getNullAttributeAccess().getValueNULLKeyword_0()); }
)

{ after(grammarAccess.getNullAttributeAccess().getValueNULLKeyword_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__BooleanAttribute__ValueAssignment
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getBooleanAttributeAccess().getValueBOOLEANTerminalRuleCall_0()); }
	RULE_BOOLEAN{ after(grammarAccess.getBooleanAttributeAccess().getValueBOOLEANTerminalRuleCall_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}


RULE_BOOLEAN : ('true'|'false');

RULE_LONG : '-'? ('0'..'9')+;

RULE_DOUBLE : '-'? ('0'..'9')+ '.' ('0'..'9')+;

RULE_DATE : ('0'..'9')+ '.' ('0'..'9')+ '.' ('0'..'9')+;

RULE_ID : '^'? ('a'..'z'|'A'..'Z'|'_'|','|'-'|'0'..'9')+;

RULE_INT : ('0'..'9')+;

RULE_STRING : ('"' ('\\' ('b'|'t'|'n'|'f'|'r'|'u'|'"'|'\''|'\\')|~(('\\'|'"')))* '"'|'\'' ('\\' ('b'|'t'|'n'|'f'|'r'|'u'|'"'|'\''|'\\')|~(('\\'|'\'')))* '\'');

RULE_ML_COMMENT : '/*' ( options {greedy=false;} : . )*'*/';

RULE_SL_COMMENT : '//' ~(('\n'|'\r'))* ('\r'? '\n')?;

RULE_WS : (' '|'\t'|'\r'|'\n')+;

RULE_ANY_OTHER : .;


