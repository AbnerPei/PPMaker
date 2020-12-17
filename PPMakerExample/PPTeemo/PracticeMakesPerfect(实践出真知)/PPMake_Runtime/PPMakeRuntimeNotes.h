//
//  PPMakeRuntimeNotes.h
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/8/24.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#ifndef PPMakeRuntimeNotes_h
#define PPMakeRuntimeNotes_h

/**
 * Returns a specified instance method for a given class.
 *
 * @param cls The class you want to inspect.
 * @param name The selector of the method you want to retrieve.
 *
 * @return The method that corresponds to the implementation of the selector specified by
 *  \e name for the class specified by \e cls, or \c NULL if the specified class or its
 *  superclasses do not contain an instance method with the specified selector.
 *
 * @note This function searches superclasses for implementations, whereas \c class_copyMethodList does not.
 */
OBJC_EXPORT Method _Nullable
class_getInstanceMethod(Class _Nullable cls, SEL _Nonnull name)
OBJC_AVAILABLE(10.0, 2.0, 9.0, 1.0, 2.0);

/**
 * Returns the function pointer that would be called if a
 * particular message were sent to an instance of a class.
 *
 * @param cls The class you want to inspect.
 * @param name A selector.
 *
 * @return The function pointer that would be called if \c [object name] were called
 *  with an instance of the class, or \c NULL if \e cls is \c Nil.
 *
 * @note \c class_getMethodImplementation may be faster than \c method_getImplementation(class_getInstanceMethod(cls, name)).
 * @note The function pointer returned may be a function internal to the runtime instead of
 *  an actual method implementation. For example, if instances of the class do not respond to
 *  the selector, the function pointer returned will be part of the runtime's message forwarding machinery.
 */
OBJC_EXPORT IMP _Nullable
class_getMethodImplementation(Class _Nullable cls, SEL _Nonnull name)
OBJC_AVAILABLE(10.5, 2.0, 9.0, 1.0, 2.0);

/**
 * Returns the implementation of a method.
 *
 * @param m The method to inspect.
 *
 * @return A function pointer of type IMP.
 */
OBJC_EXPORT IMP _Nonnull
method_getImplementation(Method _Nonnull m)
OBJC_AVAILABLE(10.5, 2.0, 9.0, 1.0, 2.0);

#endif /* PPMakeRuntimeNotes_h */
