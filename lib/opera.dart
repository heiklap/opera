// Copyright (c) 2017, Heikki K Lappalainen. All rights reserved.
// Use of this source code is governed by a BSD-style license that
// can be found in the LICENSE file.

// opera,  added here opera stuff:  originated from:  Parley

/// Objects handling operations in steps and moving in phases.
///
/// More dartdocs to come.
//

library opera;  //  meaning: operation

export 'src/opera_base.dart';

//  TODO: Export any libraries intended for clients of this package.
//  TODO  Understand previous


///  *********************************************************************
///  make this to:   opera_inf   kind of "interface"
///  only base structures that do not import outside libraries.
///  For to keep this simple.
///
///  **********************************************************************


import 'dart:async';

//  unused:  import 'package:rema/base_tools/base_tools.dart';
//  do not bring base stuff from outside packages here

//  some packages that are not meant to use in this learning-version
///  taking this temporarily away.
//  import 'package:punch/base/glb.dart'; aso.)
//  This should be "interface", that has only structures aso.
//  so no need to use punch (flow

export 'src/opera_base.dart';

/*
    some files that are not yet here
part 'cycle.dart';
part 'flow.dart';
part 'guard.dart';
part 'mission.dart';
part 'opera_rumba.dart';
part 'pole.dart';
part 'step.dart';
*/

part 'phase.dart';




// TODO: Export any libraries intended for clients of this package.

