package com.casestudydraft.tools;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = ValueMatchValidator.class)
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface ValueMatch {
    String message() default "Values do not match";

    String value();
        String otherValue();
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
    @Target({ElementType.TYPE})
    @Retention(RetentionPolicy.RUNTIME)
    @interface List{
        ValueMatch[] value();
    }
}
