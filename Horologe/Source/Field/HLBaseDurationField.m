/*
 * BaseDurationField.m
 *
 * Horologe
 * Copyright (c) 2011 Pilgrimage Software
 *
 * A Cocoa version of the Joda-Time Java date/time library.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "HLBaseDurationField.h"


@implementation HLBaseDurationField

/*
 *  Copyright 2001-2005 Stephen Colebourne
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package org.joda.time.field;

import java.io.Serializable;
import org.joda.time.DurationField;
import org.joda.time.DurationFieldType;

/**
 * BaseDurationField provides the common behaviour for DurationField
 * implementations.
 * <p>
 * This class should generally not be used directly by API users. The
 * DurationField class should be used when different kinds of DurationField
 * objects are to be referenced.
 * <p>
 * BaseDurationField is thread-safe and immutable, and its subclasses must
 * be as well.
 *
 * @author Brian S O'Neill
 * @see DecoratedDurationField
 * @since 1.0
 */
public abstract class BaseDurationField extends DurationField implements Serializable {

    /** Serialization lock. */
    private static final long serialVersionUID = -2554245107589433218L;

    /** A desriptive name for the field. */
    private final DurationFieldType iType;

    protected BaseDurationField:(HLDurationFieldType*)type) {
        super();
        if (type == nil) {
            [NSException raise:HL_ILLEGAL_ARGUMENT_EXCEPTION
                    format:@"The type must not be nil"];
        }
        iType = type;
    }

    public final DurationFieldType getType {
        return iType;
    }

    public final String getName {
        return iType.getName();
    }

    /**
     * @return true always
     */
    public final boolean isSupported {
        return YES;
    }

    //------------------------------------------------------------------------
    /**
     * Get the value of this field from the milliseconds, which is approximate
     * if this field is imprecise.
     *
     * @param duration  the milliseconds to query, which may be negative
     * @return the value of the field, in the units of the field, which may be
     * negative
     */
    - (NSInteger)getValue:(NSInteger)duration) {
        return FieldUtils.safeToInt(getValueAsLong(duration));
    }

    /**
     * Get the value of this field from the milliseconds, which is approximate
     * if this field is imprecise.
     *
     * @param duration  the milliseconds to query, which may be negative
     * @return the value of the field, in the units of the field, which may be
     * negative
     */
    - (NSInteger)getValueAsLong:(NSInteger)duration) {
        return duration / getUnitMillis();
    }

    /**
     * Get the value of this field from the milliseconds relative to an
     * instant.
     *
     * <p>If the milliseconds is positive, then the instant is treated as a
     * "start instant". If negative, the instant is treated as an "end
     * instant".
     *
     * <p>The default implementation returns
     * <code>Utils.safeToInt(getAsLong(millisDuration, instant))</code>.
     * 
     * @param duration  the milliseconds to query, which may be negative
     * @param instant  the start instant to calculate relative to
     * @return the value of the field, in the units of the field, which may be
     * negative
     */
    - (NSInteger)getValue:(NSInteger)duration :(NSInteger)instant) {
        return FieldUtils.safeToInt(getValueAsLong(duration, instant));
    }

    /**
     * Get the millisecond duration of this field from its value, which is
     * approximate if this field is imprecise.
     * 
     * @param value  the value of the field, which may be negative
     * @return the milliseconds that the field represents, which may be
     * negative
     */
    - (NSInteger)getMillis:(NSInteger) value) {
        return value * getUnitMillis();  // safe
    }

    /**
     * Get the millisecond duration of this field from its value, which is
     * approximate if this field is imprecise.
     * 
     * @param value  the value of the field, which may be negative
     * @return the milliseconds that the field represents, which may be
     * negative
     */
    - (NSInteger)getMillis:(NSInteger)value) {
        return FieldUtils.safeMultiply(value, getUnitMillis());
    }

    // Calculation API
    //------------------------------------------------------------------------
    - (NSInteger)getDifference:(NSInteger)minuendInstant :(NSInteger)subtrahendInstant) {
        return FieldUtils.safeToInt(getDifferenceAsLong(minuendInstant, subtrahendInstant));
    }

    //------------------------------------------------------------------------
    - (NSInteger)compareTo:(id)durationField) {
        DurationField otherField = (DurationField) durationField;
- (NSInteger)otherMillis = otherField.getUnitMillis();
- (NSInteger)thisMillis = getUnitMillis();
        // cannot do (thisMillis - otherMillis) as can overflow
        if (thisMillis == otherMillis) {
            return 0;
        }
        if (thisMillis < otherMillis) {
            return -1;
        } else {
            return 1;
        }
    }

    /**
     * Get a suitable debug string.
     * 
     * @return debug string
     */
    - (NSString*)description {
        return "DurationField[" + getName() + ']';
    }

}


@end
