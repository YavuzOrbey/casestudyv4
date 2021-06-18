package com.casestudydraft.tools;


import org.springframework.beans.BeanWrapperImpl;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class ValueMatchValidator implements ConstraintValidator<ValueMatch, Object> {
    private String value;
    private String otherValue;
    @Override
    public boolean isValid(Object o, ConstraintValidatorContext constraintValidatorContext) {
        Object fieldValue = new BeanWrapperImpl(o).getPropertyValue(value);
        Object fieldMatchValue = new BeanWrapperImpl(o).getPropertyValue(otherValue);

        if(fieldValue != null){
            return fieldValue.equals(fieldMatchValue);
        }
        else{
            return fieldMatchValue == null;
        }
    }

    @Override
    public void initialize(ValueMatch constraintAnnotation) {
        this.value = constraintAnnotation.value();
        this.otherValue = constraintAnnotation.otherValue();
    }
}
