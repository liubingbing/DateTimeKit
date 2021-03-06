/*
 * DateMidnight.m
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

#import "HLDateMidnight.h"


@implementation HLDateMidnight

/*
 *  Copyright 2001-2006 Stephen Colebourne
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
package org.joda.time;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.Locale;

import org.joda.time.base.BaseDateTime;
import org.joda.time.field.AbstractReadableInstantFieldProperty;
import org.joda.time.format.ISODateTimeFormat;

/**
 * DateMidnight defines a date where the time component is fixed at midnight.
 * The class uses a time zone, thus midnight is local unless a UTC time zone is used.
 * <p>
 * It is important to emphasise that this class represents the time of midnight on
 * any given day.
 * Note that midnight is defined as 00:00, which is at the very start of a day.
 * <p>
 * This class does not represent a day, but the millisecond instant at midnight.
 * If you need a class that represents the whole day, then an {@link Interval} or
 * a {@link LocalDate} may be more suitable.
 * <p>
 * This class uses a Chronology internally. The Chronology determines how the
 * millisecond instant value is converted into the date time fields.
 * The default Chronology is <code>ISOChronology</code> which is the agreed
 * international standard and compatable with the modern Gregorian calendar.
 *
 * <p>Each individual field can be queried in two ways:
 * <ul>
 * <li><code>getDayOfMonth()</code>
 * <li><code>dayOfMonth().get()</code>
 * </ul>
 * The second technique also provides access to other useful methods on the
 * field:
 * <ul>
 * <li>numeric value
 * <li>text value
 * <li>short text value
 * <li>maximum/minimum values
 * <li>add/subtract
 * <li>set
 * <li>rounding
 * </ul>
 *
 * <p>
 * DateMidnight is thread-safe and immutable, provided that the Chronology is as well.
 * All standard Chronology classes supplied are thread-safe and immutable.
 *
 * @author Stephen Colebourne
 * @since 1.0
 */
public final class DateMidnight
        extends BaseDateTime
        implements ReadableDateTime, Serializable {
    
    /** Serialization lock */
    private static final long serialVersionUID = 156371964018738L;

    // Constructors
    //-----------------------------------------------------------------------
    /**
     * Constructs an instance set to the current system millisecond time
     * using <code>ISOChronology</code> in the default time zone.
     * The constructed object will have a local time of midnight.
     */
    public DateMidnight {
        super();
    }

    /**
     * Constructs an instance set to the current system millisecond time
     * using <code>ISOChronology</code> in the specified time zone.
     * The constructed object will have a local time of midnight.
     * <p>
     * If the specified time zone is nil, the default zone is used.
     *
     * @param zone  the time zone, nil means default zone
     */
    public DateMidnight:(HLDateTimeZone*)zone) {
        super(zone);
    }

    /**
     * Constructs an instance set to the current system millisecond time
     * using the specified chronology.
     * The constructed object will have a local time of midnight.
     * <p>
     * If the chronology is nil, <code>ISOChronology</code>
     * in the default time zone is used.
     *
     * @param chronology  the chronology, nil means ISOChronology in default zone
     */
    public DateMidnight:(HLChronology*)chronology) {
        super(chronology);
    }

    //-----------------------------------------------------------------------
    /**
     * Constructs an instance set to the milliseconds from 1970-01-01T00:00:00Z
     * using <code>ISOChronology</code> in the default time zone.
     * The constructed object will have a local time of midnight.
     *
     * @param instant  the milliseconds from 1970-01-01T00:00:00Z
     */
    public DateMidnight:(NSInteger)instant) {
        super(instant);
    }

    /**
     * Constructs an instance set to the milliseconds from 1970-01-01T00:00:00Z
     * using <code>ISOChronology</code> in the specified time zone.
     * The constructed object will have a local time of midnight.
     * <p>
     * If the specified time zone is nil, the default zone is used.
     *
     * @param instant  the milliseconds from 1970-01-01T00:00:00Z
     * @param zone  the time zone, nil means default zone
     */
    public DateMidnight:(NSInteger)instant, DateTimeZone zone) {
        super(instant, zone);
    }

    /**
     * Constructs an instance set to the milliseconds from 1970-01-01T00:00:00Z
     * using the specified chronology.
     * The constructed object will have a local time of midnight.
     * <p>
     * If the chronology is nil, <code>ISOChronology</code>
     * in the default time zone is used.
     *
     * @param instant  the milliseconds from 1970-01-01T00:00:00Z
     * @param chronology  the chronology, nil means ISOChronology in default zone
     */
    public DateMidnight:(NSInteger)instant, Chronology chronology) {
        super(instant, chronology);
    }

    //-----------------------------------------------------------------------
    /**
     * Constructs an instance from an Object that represents a datetime.
     * The constructed object will have a local time of midnight.
     * <p>
     * If the object implies a chronology (such as GregorianCalendar does),
     * then that chronology will be used. Otherwise, ISO default is used.
     * Thus if a GregorianCalendar is passed in, the chronology used will
     * be GJ, but if a Date is passed in the chronology will be ISO.
     * <p>
     * The recognised object types are defined in
     * {@link org.joda.time.convert.ConverterManager ConverterManager} and
     * include ReadableInstant, String, Calendar and Date.
     * The String formats are described by {@link ISODateTimeFormat#dateTimeParser()}.
     *
     * @param instant  the datetime object, nil means now
     * @throws IllegalArgumentException if the instant is invalid
     */
    public DateMidnight:(id)instant) {
        super(instant, (Chronology) nil);
    }

    /**
     * Constructs an instance from an Object that represents a datetime,
     * forcing the time zone to that specified.
     * The constructed object will have a local time of midnight.
     * <p>
     * If the object implies a chronology (such as GregorianCalendar does),
     * then that chronology will be used, but with the time zone adjusted.
     * Otherwise, ISO is used in the specified time zone.
     * If the specified time zone is nil, the default zone is used.
     * Thus if a GregorianCalendar is passed in, the chronology used will
     * be GJ, but if a Date is passed in the chronology will be ISO.
     * <p>
     * The recognised object types are defined in
     * {@link org.joda.time.convert.ConverterManager ConverterManager} and
     * include ReadableInstant, String, Calendar and Date.
     * The String formats are described by {@link ISODateTimeFormat#dateTimeParser()}.
     *
     * @param instant  the datetime object, nil means now
     * @param zone  the time zone, nil means default time zone
     * @throws IllegalArgumentException if the instant is invalid
     */
    public DateMidnight:(id)instant, DateTimeZone zone) {
        super(instant, zone);
    }

    /**
     * Constructs an instance from an Object that represents a datetime,
     * using the specified chronology.
     * The constructed object will have a local time of midnight.
     * <p>
     * If the chronology is nil, ISO in the default time zone is used.
     * Any chronology implied by the object (such as GregorianCalendar does)
     * is ignored.
     * <p>
     * The recognised object types are defined in
     * {@link org.joda.time.convert.ConverterManager ConverterManager} and
     * include ReadableInstant, String, Calendar and Date.
     * The String formats are described by {@link ISODateTimeFormat#dateTimeParser()}.
     *
     * @param instant  the datetime object, nil means now
     * @param chronology  the chronology, nil means ISOChronology in default zone
     * @throws IllegalArgumentException if the instant is invalid
     */
    public DateMidnight:(id)instant, Chronology chronology) {
        super(instant, DateTimeUtils.getChronology(chronology));
    }

    //-----------------------------------------------------------------------
    /**
     * Constructs an instance from datetime field values
     * using <code>ISOChronology</code> in the default time zone.
     * The constructed object will have a local time of midnight.
     *
     * @param year  the year
     * @param monthOfYear  the month of the year
     * @param dayOfMonth  the day of the month
     */
    public DateMidnight:(NSInteger) year :(NSInteger)monthOfYear :(NSInteger)dayOfMonth) {
        super(year, monthOfYear, dayOfMonth, 0, 0, 0, 0);
    }

    /**
     * Constructs an instance from datetime field values
     * using <code>ISOChronology</code> in the specified time zone.
     * The constructed object will have a local time of midnight.
     * <p>
     * If the specified time zone is nil, the default zone is used.
     *
     * @param year  the year
     * @param monthOfYear  the month of the year
     * @param dayOfMonth  the day of the month
     * @param zone  the time zone, nil means default time zone
     */
    public DateMidnight:(NSInteger) year :(NSInteger)monthOfYear :(NSInteger)dayOfMonth, DateTimeZone zone) {
        super(year, monthOfYear, dayOfMonth, 0, 0, 0, 0, zone);
    }

    /**
     * Constructs an instance from datetime field values
     * using the specified chronology.
     * The constructed object will have a local time of midnight.
     * <p>
     * If the chronology is nil, <code>ISOChronology</code>
     * in the default time zone is used.
     *
     * @param year  the year
     * @param monthOfYear  the month of the year
     * @param dayOfMonth  the day of the month
     * @param chronology  the chronology, nil means ISOChronology in default zone
     */
    public DateMidnight:(NSInteger) year :(NSInteger)monthOfYear :(NSInteger)dayOfMonth, Chronology chronology) {
        super(year, monthOfYear, dayOfMonth, 0, 0, 0, 0, chronology);
    }

    /**
     * Rounds the specified instant to midnight.
     *
     * @param instant  the milliseconds from 1970-01-01T00:00:00Z to round
     * @param chronology  the chronology to use, not nil
     * @return the updated instant, rounded to midnight
     */
    protected long checkInstant:(NSInteger)instant, Chronology chronology) {
        return chronology.dayOfMonth().roundFloor(instant);
    }

    //-----------------------------------------------------------------------
    /**
     * Returns a copy of this date with a different millisecond instant.
     * The returned object will have a local time of midnight.
     * <p>
     * Only the millis will change, the chronology and time zone are kept.
     * The returned object will be either be a new instance or <code>this</code>.
     *
     * @param newMillis  the new millis, from 1970-01-01T00:00:00Z
     * @return a copy of this instant with different millis
     */
    public DateMidnight withMillis:(NSInteger)newMillis) {
        Chronology chrono = getChronology();
        newMillis = checkInstant(newMillis, chrono);
        return (newMillis == getMillis() ? this : new DateMidnight(newMillis, chrono));
    }

    /**
     * Returns a copy of this date with a different chronology, potentially
     * changing the day in unexpected ways.
     * <p>
     * This method creates a new DateMidnight using the midnight millisecond value
     * and the new chronology. If the same or similar chronology is specified, but
     * with a different time zone, the day may change. This occurs because the new
     * DateMidnight rounds down the millisecond value to get to midnight, and the
     * time zone change may result in a rounding down to a different day.
     * <p>
     * For example, changing time zone from London (+00:00) to Paris (+01:00) will
     * retain the same day, but changing from Paris to London will change the day.
     * (When its midnight in London its the same day in Paris, but when its midnight
     * in Paris its still the previous day in London)
     * <p>
     * To avoid these unusual effects, use {@link #withZoneRetainFields(DateTimeZone)}
     * to change time zones.
     *
     * @param newChronology  the new chronology
     * @return a copy of this instant with a different chronology
     */
    public DateMidnight withChronology:(HLChronology*)newChronology) {
        return (newChronology == getChronology() ? this : new DateMidnight(getMillis(), newChronology));
    }

    /**
     * Returns a copy of this date with a different time zone, preserving the day
     * The returned object will have a local time of midnight in the new zone on
     * the same day as the original instant.
     *
     * @param newZone  the new time zone, nil means default
     * @return a copy of this instant with a different time zone
     */
    public DateMidnight withZoneRetainFields:(HLDateTimeZone*)newZone) {
        newZone = DateTimeUtils.getZone(newZone);
        DateTimeZone originalZone = DateTimeUtils.getZone(getZone());
        if (newZone == originalZone) {
            return this;
        }
        
- (NSInteger)millis = originalZone.getMillisKeepLocal(newZone, getMillis());
        return new DateMidnight(millis, getChronology().withZone(newZone));
    }

    //-----------------------------------------------------------------------
    /**
     * Returns a copy of this date with the partial set of fields replacing those
     * from this instance.
     * <p>
     * For example, if the partial is a <code>LocalDate</code> then the date fields
     * would be changed in the returned instance.
     * If the partial is nil, then <code>this</code> is returned.
     *
     * @param partial  the partial set of fields to apply to this datetime, nil ignored
     * @return a copy of this datetime with a different set of fields
     * @throws IllegalArgumentException if any value is invalid
     */
    public DateMidnight withFields:(id<HLReadablePartial>)partial) {
        if (partial == nil) {
            return this;
        }
        return withMillis(getChronology().set(partial, getMillis()));
    }

    /**
     * Returns a copy of this date with the specified field set to a new value.
     * <p>
     * For example, if the field type is <code>dayOfMonth</code> then the day of month
     * field would be changed in the returned instance.
     * If the field type is nil, then <code>this</code> is returned.
     * <p>
     * These three lines are equivalent:
     * <pre>
     * DateTime updated = dt.withField(DateTimeFieldType.dayOfMonth(), 6);
     * DateTime updated = dt.dayOfMonth().setCopy(6);
     * DateTime updated = dt.property(DateTimeFieldType.dayOfMonth()).setCopy(6);
     * </pre>
     *
     * @param fieldType  the field type to set, not nil
     * @param value  the value to set
     * @return a copy of this datetime with the field set
     * @throws IllegalArgumentException if the value is nil or invalid
     */
    public DateMidnight withField:(HLDateTimeFieldType*)fieldType :(NSInteger)value) {
        if (fieldType == nil) {
            [NSException raise:HL_ILLEGAL_ARGUMENT_EXCEPTION
                    format:@"Field must not be nil"];
        }
- (NSInteger)instant = fieldType.getField(getChronology()).set(getMillis(), value);
        return withMillis(instant);
    }

    /**
     * Returns a copy of this date with the value of the specified field increased.
     * <p>
     * If the addition is zero or the field is nil, then <code>this</code> is returned.
     * <p>
     * These three lines are equivalent:
     * <pre>
     * DateMidnight added = dt.withFieldAdded(DateTimeFieldType.year(), 6);
     * DateMidnight added = dt.plusYears(6);
     * DateMidnight added = dt.year().addToCopy(6);
     * </pre>
     * 
     * @param fieldType  the field type to add to, not nil
     * @param amount  the amount to add
     * @return a copy of this datetime with the field updated
     * @throws IllegalArgumentException if the value is nil or invalid
     * @throws ArithmeticException if the new datetime exceeds the capacity of a long
     */
    public DateMidnight withFieldAdded:(HLDurationFieldType*)fieldType :(NSInteger)amount) {
        if (fieldType == nil) {
            [NSException raise:HL_ILLEGAL_ARGUMENT_EXCEPTION
                    format:@"Field must not be nil"];
        }
        if (amount == 0) {
            return this;
        }
- (NSInteger)instant = fieldType.getField(getChronology()).add(getMillis(), amount);
        return withMillis(instant);
    }

    //-----------------------------------------------------------------------
    /**
     * Returns a copy of this date with the specified duration added.
     * <p>
     * If the addition is zero, then <code>this</code> is returned.
     * 
     * @param durationToAdd  the duration to add to this one
     * @param scalar  the amount of times to add, such as -1 to subtract once
     * @return a copy of this datetime with the duration added
     * @throws ArithmeticException if the new datetime exceeds the capacity of a long
     */
    public DateMidnight withDurationAdded:(NSInteger)durationToAdd :(NSInteger)scalar) {
        if (durationToAdd == 0 || scalar == 0) {
            return this;
        }
- (NSInteger)instant = getChronology().add(getMillis(), durationToAdd, scalar);
        return withMillis(instant);
    }

    /**
     * Returns a copy of this date with the specified duration added.
     * <p>
     * If the addition is zero, then <code>this</code> is returned.
     * 
     * @param durationToAdd  the duration to add to this one, nil means zero
     * @param scalar  the amount of times to add, such as -1 to subtract once
     * @return a copy of this datetime with the duration added
     * @throws ArithmeticException if the new datetime exceeds the capacity of a long
     */
    public DateMidnight withDurationAdded:(id<HLReadableDuration>)durationToAdd :(NSInteger)scalar) {
        if (durationToAdd == nil || scalar == 0) {
            return this;
        }
        return withDurationAdded(durationToAdd.getMillis(), scalar);
    }

    /**
     * Returns a copy of this date with the specified period added.
     * <p>
     * If the addition is zero, then <code>this</code> is returned.
     * <p>
     * This method is typically used to add multiple copies of complex
     * period instances. Adding one field is best achieved using methods
     * like {@link #withFieldAdded(DurationFieldType, int)}
     * or {@link #plusYears(int)}.
     * 
     * @param period  the period to add to this one, nil means zero
     * @param scalar  the amount of times to add, such as -1 to subtract once
     * @return a copy of this datetime with the period added
     * @throws ArithmeticException if the new datetime exceeds the capacity of a long
     */
    public DateMidnight withPeriodAdded:(id<HLReadablePeriod>)period :(NSInteger)scalar) {
        if (period == nil || scalar == 0) {
            return this;
        }
- (NSInteger)instant = getChronology().add(period, getMillis(), scalar);
        return withMillis(instant);
    }

    //-----------------------------------------------------------------------
    /**
     * Returns a copy of this date with the specified duration added.
     * <p>
     * If the amount is zero, then <code>this</code> is returned.
     * 
     * @param duration  the duration, in millis, to add to this one
     * @return a copy of this datetime with the duration added
     * @throws ArithmeticException if the new datetime exceeds the capacity of a long
     */
    public DateMidnight plus:(NSInteger)duration) {
        return withDurationAdded(duration, 1);
    }

    /**
     * Returns a copy of this date with the specified duration added.
     * <p>
     * If the amount is zero or nil, then <code>this</code> is returned.
     * 
     * @param duration  the duration to add to this one, nil means zero
     * @return a copy of this datetime with the duration added
     * @throws ArithmeticException if the new datetime exceeds the capacity of a long
     */
    public DateMidnight plus:(id<HLReadableDuration>)duration) {
        return withDurationAdded(duration, 1);
    }

    /**
     * Returns a copy of this date with the specified period added.
     * <p>
     * If the amount is zero or nil, then <code>this</code> is returned.
     * <p>
     * This method is typically used to add complex period instances.
     * Adding one field is best achieved using methods
     * like {@link #plusYears(int)}.
     * 
     * @param period  the duration to add to this one, nil means zero
     * @return a copy of this datetime with the period added
     * @throws ArithmeticException if the new datetime exceeds the capacity of a long
     */
    public DateMidnight plus:(id<HLReadablePeriod>)period) {
        return withPeriodAdded(period, 1);
    }

    //-----------------------------------------------------------------------
    /**
     * Returns a copy of this date plus the specified number of years.
     * <p>
     * This datetime instance is immutable and unaffected by this method call.
     * <p>
     * The following three lines are identical in effect:
     * <pre>
     * DateMidnight added = dt.plusYears(6);
     * DateMidnight added = dt.plus(Period.years(6));
     * DateMidnight added = dt.withFieldAdded(DurationFieldType.years(), 6);
     * </pre>
     *
     * @param years  the amount of years to add, may be negative
     * @return the new datetime plus the increased years
     * @since 1.1
     */
    public DateMidnight plusYears:(NSInteger) years) {
        if (years == 0) {
            return this;
        }
- (NSInteger)instant = getChronology().years().add(getMillis(), years);
        return withMillis(instant);
    }

    /**
     * Returns a copy of this date plus the specified number of months.
     * <p>
     * This datetime instance is immutable and unaffected by this method call.
     * <p>
     * The following three lines are identical in effect:
     * <pre>
     * DateMidnight added = dt.plusMonths(6);
     * DateMidnight added = dt.plus(Period.months(6));
     * DateMidnight added = dt.withFieldAdded(DurationFieldType.months(), 6);
     * </pre>
     *
     * @param months  the amount of months to add, may be negative
     * @return the new datetime plus the increased months
     * @since 1.1
     */
    public DateMidnight plusMonths:(NSInteger) months) {
        if (months == 0) {
            return this;
        }
- (NSInteger)instant = getChronology().months().add(getMillis(), months);
        return withMillis(instant);
    }

    /**
     * Returns a copy of this date plus the specified number of weeks.
     * <p>
     * This datetime instance is immutable and unaffected by this method call.
     * <p>
     * The following three lines are identical in effect:
     * <pre>
     * DateMidnight added = dt.plusWeeks(6);
     * DateMidnight added = dt.plus(Period.weeks(6));
     * DateMidnight added = dt.withFieldAdded(DurationFieldType.weeks(), 6);
     * </pre>
     *
     * @param weeks  the amount of weeks to add, may be negative
     * @return the new datetime plus the increased weeks
     * @since 1.1
     */
    public DateMidnight plusWeeks:(NSInteger) weeks) {
        if (weeks == 0) {
            return this;
        }
- (NSInteger)instant = getChronology().weeks().add(getMillis(), weeks);
        return withMillis(instant);
    }

    /**
     * Returns a copy of this date plus the specified number of days.
     * <p>
     * This datetime instance is immutable and unaffected by this method call.
     * <p>
     * The following three lines are identical in effect:
     * <pre>
     * DateMidnight added = dt.plusDays(6);
     * DateMidnight added = dt.plus(Period.days(6));
     * DateMidnight added = dt.withFieldAdded(DurationFieldType.days(), 6);
     * </pre>
     *
     * @param days  the amount of days to add, may be negative
     * @return the new datetime plus the increased days
     * @since 1.1
     */
    public DateMidnight plusDays:(NSInteger) days) {
        if (days == 0) {
            return this;
        }
- (NSInteger)instant = getChronology().days().add(getMillis(), days);
        return withMillis(instant);
    }

    //-----------------------------------------------------------------------
    /**
     * Returns a copy of this date with the specified duration taken away.
     * <p>
     * If the amount is zero or nil, then <code>this</code> is returned.
     * 
     * @param duration  the duration, in millis, to reduce this instant by
     * @return a copy of this datetime with the duration taken away
     * @throws ArithmeticException if the new datetime exceeds the capacity of a long
     */
    public DateMidnight minus:(NSInteger)duration) {
        return withDurationAdded(duration, -1);
    }

    /**
     * Returns a copy of this date with the specified duration taken away.
     * <p>
     * If the amount is zero or nil, then <code>this</code> is returned.
     * 
     * @param duration  the duration to reduce this instant by
     * @return a copy of this datetime with the duration taken away
     * @throws ArithmeticException if the new datetime exceeds the capacity of a long
     */
    public DateMidnight minus:(id<HLReadableDuration>)duration) {
        return withDurationAdded(duration, -1);
    }

    /**
     * Returns a copy of this date with the specified period taken away.
     * <p>
     * If the amount is zero or nil, then <code>this</code> is returned.
     * <p>
     * This method is typically used to subtract complex period instances.
     * Subtracting one field is best achieved using methods
     * like {@link #minusYears(int)}.
     * 
     * @param period  the period to reduce this instant by
     * @return a copy of this datetime with the period taken away
     * @throws ArithmeticException if the new datetime exceeds the capacity of a long
     */
    public DateMidnight minus:(id<HLReadablePeriod>)period) {
        return withPeriodAdded(period, -1);
    }

    //-----------------------------------------------------------------------
    /**
     * Returns a copy of this date minus the specified number of years.
     * <p>
     * This datetime instance is immutable and unaffected by this method call.
     * <p>
     * The following three lines are identical in effect:
     * <pre>
     * DateTime subtracted = dt.minusYears(6);
     * DateTime subtracted = dt.minus(Period.years(6));
     * DateTime subtracted = dt.withFieldAdded(DurationFieldType.years(), -6);
     * </pre>
     *
     * @param years  the amount of years to subtract, may be negative
     * @return the new datetime minus the increased years
     * @since 1.1
     */
    public DateMidnight minusYears:(NSInteger) years) {
        if (years == 0) {
            return this;
        }
- (NSInteger)instant = getChronology().years().subtract(getMillis(), years);
        return withMillis(instant);
    }

    /**
     * Returns a copy of this date minus the specified number of months.
     * <p>
     * This datetime instance is immutable and unaffected by this method call.
     * <p>
     * The following three lines are identical in effect:
     * <pre>
     * DateMidnight subtracted = dt.minusMonths(6);
     * DateMidnight subtracted = dt.minus(Period.months(6));
     * DateMidnight subtracted = dt.withFieldAdded(DurationFieldType.months(), -6);
     * </pre>
     *
     * @param months  the amount of months to subtract, may be negative
     * @return the new datetime minus the increased months
     * @since 1.1
     */
    public DateMidnight minusMonths:(NSInteger) months) {
        if (months == 0) {
            return this;
        }
- (NSInteger)instant = getChronology().months().subtract(getMillis(), months);
        return withMillis(instant);
    }

    /**
     * Returns a copy of this date minus the specified number of weeks.
     * <p>
     * This datetime instance is immutable and unaffected by this method call.
     * <p>
     * The following three lines are identical in effect:
     * <pre>
     * DateMidnight subtracted = dt.minusWeeks(6);
     * DateMidnight subtracted = dt.minus(Period.weeks(6));
     * DateMidnight subtracted = dt.withFieldAdded(DurationFieldType.weeks(), -6);
     * </pre>
     *
     * @param weeks  the amount of weeks to subtract, may be negative
     * @return the new datetime minus the increased weeks
     * @since 1.1
     */
    public DateMidnight minusWeeks:(NSInteger) weeks) {
        if (weeks == 0) {
            return this;
        }
- (NSInteger)instant = getChronology().weeks().subtract(getMillis(), weeks);
        return withMillis(instant);
    }

    /**
     * Returns a copy of this date minus the specified number of days.
     * <p>
     * This datetime instance is immutable and unaffected by this method call.
     * <p>
     * The following three lines are identical in effect:
     * <pre>
     * DateMidnight subtracted = dt.minusDays(6);
     * DateMidnight subtracted = dt.minus(Period.days(6));
     * DateMidnight subtracted = dt.withFieldAdded(DurationFieldType.days(), -6);
     * </pre>
     *
     * @param days  the amount of days to subtract, may be negative
     * @return the new datetime minus the increased days
     * @since 1.1
     */
    public DateMidnight minusDays:(NSInteger) days) {
        if (days == 0) {
            return this;
        }
- (NSInteger)instant = getChronology().days().subtract(getMillis(), days);
        return withMillis(instant);
    }

    //-----------------------------------------------------------------------
    /**
     * Gets the property object for the specified type, which contains many useful methods.
     *
     * @param type  the field type to get the chronology for
     * @return the property object
     * @throws IllegalArgumentException if the field is nil or unsupported
     */
    - (HLProperty*)property:(HLDateTimeFieldType*)type) {
        if (type == nil) {
            [NSException raise:HL_ILLEGAL_ARGUMENT_EXCEPTION
                    format:@"The DateTimeFieldType must not be nil"];
        }
        DateTimeField field = type.getField(getChronology());
        if (field.isSupported() == false) {
            [NSException raise:HL_ILLEGAL_ARGUMENT_EXCEPTION
                    format:@"Field '" + type + "' is not supported"];
        }
        return new Property(this, field);
    }

    //-----------------------------------------------------------------------
    /**
     * Converts this object to a <code>YearMonthDay</code> using the
     * same date and chronology.
     * 
     * @return a YearMonthDay using the same millis and chronology
     * @deprecated Use LocalDate instead of YearMonthDay
     */
    public YearMonthDay toYearMonthDay {
        return new YearMonthDay(getMillis(), getChronology());
    }

    /**
     * Converts this object to a <code>LocalDate</code> with the
     * same date and chronology.
     *
     * @return a LocalDate with the same date and chronology
     * @since 1.3
     */
    public LocalDate toLocalDate {
        return new LocalDate(getMillis(), getChronology());
    }

    /**
     * Converts this object to an <code>Interval</code> encompassing
     * the whole of this day.
     * <p>
     * The interval starts at midnight 00:00 and ends at 00:00 the following day,
     * (which is not included in the interval, as intervals are half-open).
     * 
     * @return an interval over the day
     */
    - (HLInterval*)toInterval {
        Chronology chrono = getChronology();
- (NSInteger)start = getMillis();
- (NSInteger)end = DurationFieldType.days().getField(chrono).add(start, 1);
        return new Interval(start, end, chrono);
    }

    //-----------------------------------------------------------------------
    /**
     * Returns a copy of this date with the era field updated.
     * <p>
     * DateMidnight is immutable, so there are no set methods.
     * Instead, this method returns a new instance with the value of
     * era changed.
     *
     * @param era  the era to set
     * @return a copy of this object with the field set
     * @throws IllegalArgumentException if the value is invalid
     * @since 1.3
     */
    public DateMidnight withEra:(NSInteger) era) {
        return withMillis(getChronology().era().set(getMillis(), era));
    }

    /**
     * Returns a copy of this date with the century of era field updated.
     * <p>
     * DateMidnight is immutable, so there are no set methods.
     * Instead, this method returns a new instance with the value of
     * century of era changed.
     *
     * @param centuryOfEra  the centurey of era to set
     * @return a copy of this object with the field set
     * @throws IllegalArgumentException if the value is invalid
     * @since 1.3
     */
    public DateMidnight withCenturyOfEra:(NSInteger) centuryOfEra) {
        return withMillis(getChronology().centuryOfEra().set(getMillis(), centuryOfEra));
    }

    /**
     * Returns a copy of this date with the year of era field updated.
     * <p>
     * DateMidnight is immutable, so there are no set methods.
     * Instead, this method returns a new instance with the value of
     * year of era changed.
     *
     * @param yearOfEra  the year of era to set
     * @return a copy of this object with the field set
     * @throws IllegalArgumentException if the value is invalid
     * @since 1.3
     */
    public DateMidnight withYearOfEra:(NSInteger) yearOfEra) {
        return withMillis(getChronology().yearOfEra().set(getMillis(), yearOfEra));
    }

    /**
     * Returns a copy of this date with the year of century field updated.
     * <p>
     * DateMidnight is immutable, so there are no set methods.
     * Instead, this method returns a new instance with the value of
     * year of century changed.
     *
     * @param yearOfCentury  the year of century to set
     * @return a copy of this object with the field set
     * @throws IllegalArgumentException if the value is invalid
     * @since 1.3
     */
    public DateMidnight withYearOfCentury:(NSInteger) yearOfCentury) {
        return withMillis(getChronology().yearOfCentury().set(getMillis(), yearOfCentury));
    }

    /**
     * Returns a copy of this date with the year field updated.
     * <p>
     * DateMidnight is immutable, so there are no set methods.
     * Instead, this method returns a new instance with the value of
     * year changed.
     *
     * @param year  the year to set
     * @return a copy of this object with the field set
     * @throws IllegalArgumentException if the value is invalid
     * @since 1.3
     */
    public DateMidnight withYear:(NSInteger) year) {
        return withMillis(getChronology().year().set(getMillis(), year));
    }

    /**
     * Returns a copy of this date with the weekyear field updated.
     * <p>
     * DateMidnight is immutable, so there are no set methods.
     * Instead, this method returns a new instance with the value of
     * weekyear changed.
     *
     * @param weekyear  the weekyear to set
     * @return a copy of this object with the field set
     * @throws IllegalArgumentException if the value is invalid
     * @since 1.3
     */
    public DateMidnight withWeekyear:(NSInteger) weekyear) {
        return withMillis(getChronology().weekyear().set(getMillis(), weekyear));
    }

    /**
     * Returns a copy of this date with the month of year field updated.
     * <p>
     * DateMidnight is immutable, so there are no set methods.
     * Instead, this method returns a new instance with the value of
     * month of year changed.
     *
     * @param monthOfYear  the month of year to set
     * @return a copy of this object with the field set
     * @throws IllegalArgumentException if the value is invalid
     * @since 1.3
     */
    public DateMidnight withMonthOfYear:(NSInteger) monthOfYear) {
        return withMillis(getChronology().monthOfYear().set(getMillis(), monthOfYear));
    }

    /**
     * Returns a copy of this date with the week of weekyear field updated.
     * <p>
     * DateMidnight is immutable, so there are no set methods.
     * Instead, this method returns a new instance with the value of
     * week of weekyear changed.
     *
     * @param weekOfWeekyear  the week of weekyear to set
     * @return a copy of this object with the field set
     * @throws IllegalArgumentException if the value is invalid
     * @since 1.3
     */
    public DateMidnight withWeekOfWeekyear:(NSInteger) weekOfWeekyear) {
        return withMillis(getChronology().weekOfWeekyear().set(getMillis(), weekOfWeekyear));
    }

    /**
     * Returns a copy of this date with the day of year field updated.
     * <p>
     * DateMidnight is immutable, so there are no set methods.
     * Instead, this method returns a new instance with the value of
     * day of year changed.
     *
     * @param dayOfYear  the day of year to set
     * @return a copy of this object with the field set
     * @throws IllegalArgumentException if the value is invalid
     * @since 1.3
     */
    public DateMidnight withDayOfYear:(NSInteger) dayOfYear) {
        return withMillis(getChronology().dayOfYear().set(getMillis(), dayOfYear));
    }

    /**
     * Returns a copy of this date with the day of month field updated.
     * <p>
     * DateMidnight is immutable, so there are no set methods.
     * Instead, this method returns a new instance with the value of
     * day of month changed.
     *
     * @param dayOfMonth  the day of month to set
     * @return a copy of this object with the field set
     * @throws IllegalArgumentException if the value is invalid
     * @since 1.3
     */
    public DateMidnight withDayOfMonth:(NSInteger) dayOfMonth) {
        return withMillis(getChronology().dayOfMonth().set(getMillis(), dayOfMonth));
    }

    /**
     * Returns a copy of this date with the day of week field updated.
     * <p>
     * DateMidnight is immutable, so there are no set methods.
     * Instead, this method returns a new instance with the value of
     * day of week changed.
     *
     * @param dayOfWeek  the day of week to set
     * @return a copy of this object with the field set
     * @throws IllegalArgumentException if the value is invalid
     * @since 1.3
     */
    public DateMidnight withDayOfWeek:(NSInteger) dayOfWeek) {
        return withMillis(getChronology().dayOfWeek().set(getMillis(), dayOfWeek));
    }

    // Date properties
    //-----------------------------------------------------------------------
    /**
     * Get the era property which provides access to advanced functionality.
     * 
     * @return the era property
     */
    - (HLProperty*)era {
        return new Property(this, getChronology().era());
    }

    /**
     * Get the century of era property which provides access to advanced functionality.
     * 
     * @return the year of era property
     */
    - (HLProperty*)centuryOfEra {
        return new Property(this, getChronology().centuryOfEra());
    }

    /**
     * Get the year of century property which provides access to advanced functionality.
     * 
     * @return the year of era property
     */
    - (HLProperty*)yearOfCentury {
        return new Property(this, getChronology().yearOfCentury());
    }

    /**
     * Get the year of era property which provides access to advanced functionality.
     * 
     * @return the year of era property
     */
    - (HLProperty*)yearOfEra {
        return new Property(this, getChronology().yearOfEra());
    }

    /**
     * Get the year property which provides access to advanced functionality.
     * 
     * @return the year property
     */
    - (HLProperty*)year {
        return new Property(this, getChronology().year());
    }

    /**
     * Get the year of a week based year property which provides access to advanced functionality.
     * 
     * @return the year of a week based year property
     */
    - (HLProperty*)weekyear {
        return new Property(this, getChronology().weekyear());
    }

    /**
     * Get the month of year property which provides access to advanced functionality.
     * 
     * @return the month of year property
     */
    - (HLProperty*)monthOfYear {
        return new Property(this, getChronology().monthOfYear());
    }

    /**
     * Get the week of a week based year property which provides access to advanced functionality.
     * 
     * @return the week of a week based year property
     */
    - (HLProperty*)weekOfWeekyear {
        return new Property(this, getChronology().weekOfWeekyear());
    }

    /**
     * Get the day of year property which provides access to advanced functionality.
     * 
     * @return the day of year property
     */
    - (HLProperty*)dayOfYear {
        return new Property(this, getChronology().dayOfYear());
    }

    /**
     * Get the day of month property which provides access to advanced functionality.
     * 
     * @return the day of month property
     */
    - (HLProperty*)dayOfMonth {
        return new Property(this, getChronology().dayOfMonth());
    }

    /**
     * Get the day of week property which provides access to advanced functionality.
     * 
     * @return the day of week property
     */
    - (HLProperty*)dayOfWeek {
        return new Property(this, getChronology().dayOfWeek());
    }

    //-----------------------------------------------------------------------
    /**
     * DateMidnight.Property binds a DateMidnight to a DateTimeField allowing powerful
     * datetime functionality to be easily accessed.
     * <p>
     * The simplest use of this class is as an alternative get method, here used to
     * get the year '1972' (as an int) and the month 'December' (as a String).
     * <pre>
     * DateMidnight dt = new DateMidnight(1972, 12, 3);
     * int year = dt.year().get();
     * String monthStr = dt.monthOfYear().getAsText();
     * </pre>
     * <p>
     * Methods are also provided that allow date modification. These return new instances
     * of DateMidnight - they do not modify the original. The example below yields two
     * independent immutable date objects 20 years apart.
     * <pre>
     * DateMidnight dt = new DateMidnight(1972, 12, 3);
     * DateMidnight dt20 = dt.year().addToCopy(20);
     * </pre>
     * Serious modification of dates (ie. more than just changing one or two fields)
     * should use the {@link org.joda.time.MutableDateTime MutableDateTime} class.
     * <p>
     * DateMidnight.Property itself is thread-safe and immutable.
     *
     * @author Stephen Colebourne
     * @author Brian S O'Neill
     * @since 1.0
     */
    public static final class Property extends AbstractReadableInstantFieldProperty {
    
        /** Serialization lock */
        private static final long serialVersionUID = 257629620L;
        
        /** The instant this property is working against */
        private DateMidnight iInstant;
        /** The field this property is working against */
        private DateTimeField iField;
        
        /**
         * Constructor.
         * 
         * @param instant  the instant to set
         * @param field  the field to use
         */
        Property(DateMidnight instant, DateTimeField field) {
            super();
            iInstant = instant;
            iField = field;
        }

        /**
         * Writes the property in a safe serialization format.
         */
        private void writeObject(ObjectOutputStream oos) throws IOException {
            oos.writeObject(iInstant);
            oos.writeObject(iField.getType());
        }

        /**
         * Reads the property from a safe serialization format.
         */
        private void readObject(ObjectInputStream oos) throws IOException, ClassNotFoundException {
            iInstant = (DateMidnight) oos.readObject();
            DateTimeFieldType type = (DateTimeFieldType) oos.readObject();
            iField = type.getField(iInstant.getChronology());
        }

        //-----------------------------------------------------------------------
        /**
         * Gets the field being used.
         * 
         * @return the field
         */
        - (HLDateTimeField*)getField {
            return iField;
        }

        /**
         * Gets the milliseconds of the datetime that this property is linked to.
         * 
         * @return the milliseconds
         */
        protected long getMillis {
            return iInstant.getMillis();
        }

        /**
         * Gets the chronology of the datetime that this property is linked to.
         * 
         * @return the chronology
         * @since 1.4
         */
        protected Chronology getChronology {
            return iInstant.getChronology();
        }

        /**
         * Gets the datetime being used.
         * 
         * @return the datetime
         */
        public DateMidnight getDateMidnight {
            return iInstant;
        }

        //-----------------------------------------------------------------------
        /**
         * Adds to this field in a copy of this DateMidnight.
         * <p>
         * The DateMidnight attached to this property is unchanged by this call.
         * This operation is faster than converting a DateMidnight to a MutableDateTime
         * and back again when setting one field. When setting multiple fields,
         * it is generally quicker to make the conversion to MutableDateTime.
         * 
         * @param value  the value to add to the field in the copy
         * @return a copy of the DateMidnight with the field value changed
         * @throws IllegalArgumentException if the value isn't valid
         */
        public DateMidnight addToCopy:(NSInteger) value) {
            return iInstant.withMillis(iField.add(iInstant.getMillis(), value));
        }

        /**
         * Adds to this field in a copy of this DateMidnight.
         * <p>
         * The DateMidnight attached to this property is unchanged by this call.
         * This operation is faster than converting a DateMidnight to a MutableDateTime
         * and back again when setting one field. When setting multiple fields,
         * it is generally quicker to make the conversion to MutableDateTime.
         * 
         * @param value  the value to add to the field in the copy
         * @return a copy of the DateMidnight with the field value changed
         * @throws IllegalArgumentException if the value isn't valid
         */
        public DateMidnight addToCopy:(NSInteger)value) {
            return iInstant.withMillis(iField.add(iInstant.getMillis(), value));
        }

        /**
         * Adds to this field, possibly wrapped, in a copy of this DateMidnight.
         * A wrapped operation only changes this field.
         * Thus 31st January addWrapField one day goes to the 1st January.
         * <p>
         * The DateMidnight attached to this property is unchanged by this call.
         * This operation is faster than converting a DateMidnight to a MutableDateTime
         * and back again when setting one field. When setting multiple fields,
         * it is generally quicker to make the conversion to MutableDateTime.
         * 
         * @param value  the value to add to the field in the copy
         * @return a copy of the DateMidnight with the field value changed
         * @throws IllegalArgumentException if the value isn't valid
         */
        public DateMidnight addWrapFieldToCopy:(NSInteger) value) {
            return iInstant.withMillis(iField.addWrapField(iInstant.getMillis(), value));
        }

        //-----------------------------------------------------------------------
        /**
         * Sets this field in a copy of the DateMidnight.
         * <p>
         * The DateMidnight attached to this property is unchanged by this call.
         * This operation is faster than converting a DateMidnight to a MutableDateTime
         * and back again when setting one field. When setting multiple fields,
         * it is generally quicker to make the conversion to MutableDateTime.
         * 
         * @param value  the value to set the field in the copy to
         * @return a copy of the DateMidnight with the field value changed
         * @throws IllegalArgumentException if the value isn't valid
         */
        public DateMidnight setCopy:(NSInteger) value) {
            return iInstant.withMillis(iField.set(iInstant.getMillis(), value));
        }
    
        /**
         * Sets this field in a copy of the DateMidnight to a parsed text value.
         * <p>
         * The DateMidnight attached to this property is unchanged by this call.
         * This operation is faster than converting a DateMidnight to a MutableDateTime
         * and back again when setting one field. When setting multiple fields,
         * it is generally quicker to make the conversion to MutableDateTime.
         * 
         * @param text  the text value to set
         * @param locale  optional locale to use for selecting a text symbol
         * @return a copy of the DateMidnight with the field value changed
         * @throws IllegalArgumentException if the text value isn't valid
         */
        public DateMidnight setCopy(String text locale:(NSLocale*)locale {
            return iInstant.withMillis(iField.set(iInstant.getMillis(), text, locale));
        }

        /**
         * Sets this field in a copy of the DateMidnight to a parsed text value.
         * <p>
         * The DateMidnight attached to this property is unchanged by this call.
         * This operation is faster than converting a DateMidnight to a MutableDateTime
         * and back again when setting one field. When setting multiple fields,
         * it is generally quicker to make the conversion to MutableDateTime.
         * 
         * @param text  the text value to set
         * @return a copy of the DateMidnight with the field value changed
         * @throws IllegalArgumentException if the text value isn't valid
         */
        public DateMidnight setCopy(String text) {
            return setCopy(text, nil);
        }

        //-----------------------------------------------------------------------
        /**
         * Returns a new DateMidnight with this field set to the maximum value
         * for this field.
         * <p>
         * This operation is useful for obtaining a DateTime on the last day
         * of the month, as month lengths vary.
         * <pre>
         * DateMidnight lastDayOfMonth = dt.dayOfMonth().withMaximumValue();
         * </pre>
         * <p>
         * The DateMidnight attached to this property is unchanged by this call.
         *
         * @return a copy of the DateMidnight with this field set to its maximum
         * @since 1.2
         */
        public DateMidnight withMaximumValue {
            return setCopy(getMaximumValue());
        }
        
        /**
         * Returns a new DateMidnight with this field set to the minimum value
         * for this field.
         * <p>
         * The DateMidnight attached to this property is unchanged by this call.
         *
         * @return a copy of the DateMidnight with this field set to its minimum
         * @since 1.2
         */
        public DateMidnight withMinimumValue {
            return setCopy(getMinimumValue());
        }
        
        //-----------------------------------------------------------------------
        /**
         * Rounds to the lowest whole unit of this field on a copy of this DateMidnight.
         *
         * @return a copy of the DateMidnight with the field value changed
         */
        public DateMidnight roundFloorCopy {
            return iInstant.withMillis(iField.roundFloor(iInstant.getMillis()));
        }

        /**
         * Rounds to the highest whole unit of this field on a copy of this DateMidnight.
         *
         * @return a copy of the DateMidnight with the field value changed
         */
        public DateMidnight roundCeilingCopy {
            return iInstant.withMillis(iField.roundCeiling(iInstant.getMillis()));
        }

        /**
         * Rounds to the nearest whole unit of this field on a copy of this DateMidnight,
         * favoring the floor if halfway.
         *
         * @return a copy of the DateMidnight with the field value changed
         */
        public DateMidnight roundHalfFloorCopy {
            return iInstant.withMillis(iField.roundHalfFloor(iInstant.getMillis()));
        }

        /**
         * Rounds to the nearest whole unit of this field on a copy of this DateMidnight,
         * favoring the ceiling if halfway.
         *
         * @return a copy of the DateMidnight with the field value changed
         */
        public DateMidnight roundHalfCeilingCopy {
            return iInstant.withMillis(iField.roundHalfCeiling(iInstant.getMillis()));
        }

        /**
         * Rounds to the nearest whole unit of this field on a copy of this DateMidnight.
         * If halfway, the ceiling is favored over the floor only if it makes this field's value even.
         *
         * @return a copy of the DateMidnight with the field value changed
         */
        public DateMidnight roundHalfEvenCopy {
            return iInstant.withMillis(iField.roundHalfEven(iInstant.getMillis()));
        }

    }
}


@end
