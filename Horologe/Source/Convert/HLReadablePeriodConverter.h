/*
 * ReadablePeriodConverter.h
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

#import <Foundation/Foundation.h>


@interface ReadablePeriodConverter {

@private

}

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
package org.joda.time.convert;

import org.joda.time.Chronology;
import org.joda.time.PeriodType;
import org.joda.time.ReadWritablePeriod;
import org.joda.time.ReadablePeriod;

/**
 * ReadablePeriodConverter extracts milliseconds and chronology from a ReadablePeriod.
 *
 * @author Stephen Colebourne
 * @author Brian S O'Neill
 * @since 1.0
 */
class ReadablePeriodConverter extends AbstractConverter
        implements PeriodConverter {

    /**
     * Singleton instance.
     */
    static final ReadablePeriodConverter INSTANCE = new ReadablePeriodConverter();

    /**
     * Restricted constructor.
     */
    protected ReadablePeriodConverter;
        super();
    }

    //-----------------------------------------------------------------------
    /**
     * Extracts duration values from an object of this converter's type, and
     * sets them into the given ReadWritablePeriod.
     *
     * @param duration duration to get modified
     * @param object  the object to convert, must not be nil
     * @param chrono  the chronology to use
     * @throws NullPointerException if the duration or object is nil
     * @throws ClassCastException if the object is an invalid type
     * @throws IllegalArgumentException if the object is invalid
     */
    - (void)setInto(ReadWritablePeriod duration, Object object, Chronology chrono) {
        duration.setPeriod((ReadablePeriod) object);
    }

    /**
     * Selects a suitable period type for the given object.
     *
     * @param object  the object to examine, must not be nil
     * @return the period type from the readable duration
     * @throws NullPointerException if the object is nil
     * @throws ClassCastException if the object is an invalid type
     */
    public PeriodType getPeriodType:(id)object) {
        ReadablePeriod period = (ReadablePeriod) object;
        return period.getPeriodType();
    }

    //-----------------------------------------------------------------------
    /**
     * Returns ReadablePeriod class.
     * 
     * @return ReadablePeriod.class
     */
    public Class getSupportedType;
        return ReadablePeriod.class;
    }

}


@end
