///  opera,  originated from:  Parley ( my other project )
/// *  hkl  27.8.2016     library glb   phase
/// * phases and movements / development   logic for parley
/// *  %: 4     #   &   @
///
///  Parley is my separate negotiation app, nego is its part
///
/// NEXT
/// NOTE
///
/// Usage of some words:
/// phase is named here   112  times.  Not funny, do something :)
/// ..  but nothing so bad in it..  112
///
/// owner: 8x, and in opera_rumba. It is not an important variable here.
/// in guard.dart  owner shows 'Opera' so user/ main -class
/// Idea might be that Objects may own some smaller objects
///
/// prize:  7x  not inside any of classes, just a little generator play
///     - Might eventually be some kind of reward, from reaching phases
///     or conducting some steps
///
/// DATA INPUT::
///   String  ,int    ,bool    ,Map    ,   List   ,    StrBuf
///
///  USAGE:
//

//  TODO  how Opera  uses  this phase ??

part of opera;




///  Base collections for phases
///  Use this if you only have one line of Phases
///  map for phases
Map <String, Phase> phaseM = {};

/// List to collect phases
///
List<Phase> phaseL = new List();

// if one iterator is not enough
var phaseIterator = phaseL.iterator;



List<String> genePhaseL = new List();   //  for sync
List<String> genePrizeL = new List();    //  for async


///  filling phases data to phasesL
void phasesFillSample() {
  phaseL.addAll([
    phsOff,
    phsWake,
    phsOn,
    phsBuild,
    phsInit,
    phsInData,
    phsRumba,
    phsExtra,
    phsUnKnown,
    phsSteward,
    phsNego,
    phsNogo,
    phsNOP,
    phsError,
    phsOutData,
    phsStop,
    phsDone,
    phsClose
  ]);
}


///  Fill phases List
void phasesFill(List<Phase> pList) {
  phaseL.addAll(pList);
}





///  hklTry  to implement synchronous generator for Phase
///  hklTry  use parameter (n) away
Iterable phaseLGene() sync* {
  print(' --  synchronous generator');
  //  using genePhaseL list
  int k = 0;
  int c = 0;
  while (k < genePhaseL.length) {   //  upper-level List here

    yield genePhaseL[k++];

    print(genePhaseL[c]);
    c++;
  }
}


//  asynchronous generator   used  in async   parley_op.dart
//TODO  generator async
Stream prizeLGene() async* {
  print(' -- asynchronous generator');
  print(' --  your get answers at the end  --');
  int k = 0;
  int c = 0;
  print('int c in prizGene  $c ');
  while (k < genePrizeL.length) {

    yield genePrizeL[k++];
    print('--prizeLGene > get list[item] at the end::  ');
    //  print(genePrizeL[c]);   //  prints list.items at the end second time
    c++;
  }
}



///  Parley:s sub phases and main app parts
///  Is this for *every* phase ???
abstract class BasePhase{
  String nature = 'Phase';
  String name = '';
  String ab = 'BasePhase class model';
  String motto = 'Take care of Parley Phases';
  String owner = '';

  //TODO  static string test
  static String staticNote = 'static variable test in opera / phase class';

  bool active = false;
  bool done = false;

  //  No lists or maps. All logic is outside class
  //  phaseList  outside can manipulate all Phases
  //  creating inner-phase-map
  ///  Giving class fields start-values (build is next step)
  void init() {
    active = true;
    print('  --  phase init done');
  }

  ///
  void stop() {
    active = false;
    print('  --  phase stop done');
  }
  ///
  void info(String emblem) {
    String emblemS = '$emblem $emblem $emblem';
    print('$emblemS   $ab       $emblemS  ');
    print('     ******   BasePhase-info   ******');
    print('     nature:  $nature');
    print('     name:    $name');
    print('     ab:      $ab');
    print('     motto:   $motto');

    print('     P:active:   $active');
    print('     P:done:     $done');

    if(active) {
      print('     Owner:  $owner ');}
    print('$emblemS   $ab done  $emblemS ');
  }
}


///  Parleys  main  #Phase  system
///  some phase idea
///  TODO  Phase instances,  where are they build?  4-9 pcs, maybe
///  %: 3  readyState
class Phase extends BasePhase{
  ///  nature field separates differently behaving objects
  String nature = 'Phase';
  String name = '';
  String ab = 'Phase class model';
  String motto = 'Take care of Parley Phases';
  ///  To who does this object serve
  String owner = '';

  ///TODO  static  variable in class. Just a test
  static String staticNote = 'static variable test in opera / phase class';

  ///  impact and pending in phase and step. for some coming usage
  var pending;
  var impact;    // reserved word for activity in phase - step - mission

  bool active = false;  // maybe more than one phase can be active at a time.
  bool done = false;
  ///  Upper level Steps are not tied to certain phases, but phase may mark
  ///  some steps as it's own, so what are required to reach this phase
  List<String> stepL = [];

  ///  void info from super
  ///  Giving start values
  void init() {
    active = true;
    print('  --  phase init done');
  }
  //  add separate build-method
  /// all real work should happen here
  void gung() {
    ///TODO  flow
    //  code here
    print('\n performing phase::  $name  $ab FOR::  $motto');
  }
  ///  marks that all necessary for this step are reached
  void stop() {
    active = false;
    done = true;
    print('  --  phase stop done');
  }

  ///  simple constructor
  Phase(this.name, this.ab, this.owner) {
  }
  void info(String emblem) {
    String emblemS = '$emblem $emblem $emblem';
    print('$emblemS   $ab       $emblemS  ');
    print('     ******   BasePhase-info   ******');
    print('     nature:  $nature');
    print('     name:    $name');
    print('     ab:      $ab');
    print('     motto:   $motto');

    print('     P:active:   $active');
    print('     P:done:     $done');

    if(active) {
      print('     Owner:  $owner ');}
    print('$emblemS   $ab done  $emblemS ');
  }
}      //  ------------   class Phase


///  Functions that control phases. Add other necessary classes, before
///  planning how to do these.  You really can not build these, before you
///  have whole picture of this opera-system.
///  TODO  Future  howTo 8
///  Access to path class from outside
Future phaseDoFutu() {
  String name = 'Function returning future';
  //  code here
  String _s() {
    String retS = ('Future based String:   $name ');
    return retS;       //  'Future based String';
  }

  return new Future(_s);
}


///  just another future. Maybe use async.
phaseFutu() {
  var future = phaseDoFutu();
  //  code for phase
  //  code for content
  future.then((content) => print(content));
}



///  Control this Phase.  Access to Phase class from outside
String phaseDo() {
  String _s = '';

  return _s;
}



///  Move in phases, forward and maybe back.
void phaser(Phase _phs, String act) {
  //  code
}



/// This should be in user / client data
///   Creating  phases for Parley in base: this.name, this.ab, this.owner
var phsOff  = new Phase('PhaseOff', 'PhsOff', 'Ow: ');
var phsWake = new Phase('PhaseWake', 'PhsWake', 'Ow: ');
var phsOn   = new Phase('PhaseOn', 'PhsOn', 'Ow: ');

var phsBuild  = new Phase('PhaseBuild', 'PhsBuild', 'Ow: ');
var phsInit   = new Phase('PhaseInit', 'PhsInit', 'Ow: ');
var phsInData = new Phase('PhaseInData', 'PhsInData', 'Ow: ');

var phsRumba = new Phase('PhaseRumba', 'PhsRumba', 'Ow: ');

var phsExtra   = new Phase('PhaseExtra', 'PhsExtra', 'Ow: ');
var phsUnKnown = new Phase('PhaseUnknown', 'PhsUnknown', 'Ow: ');

///  Steward is outside isolate worker with some services
var phsSteward = new Phase('PhaseSteward', 'PhsSteward', 'Ow: ');
var phsNego = new Phase('PhaseNego', 'PhsNego', 'Ow: ');
var phsNogo = new Phase('PhaseNogo', 'PhsNogo', 'Ow: ');

var phsNOP = new Phase('PhaseNoOperation', 'PhsNoOp', 'Ow: ');     //  No operation
var phsError = new Phase('PhaseError', 'PhsEr', 'Ow: ');     //  No operation


var phsOutData = new Phase('PhaseOutData', 'PhsOutD', 'Ow: ');

var phsStop = new Phase('PhaseStop', 'PhsStop', 'Ow: ');
var phsDone = new Phase('PhaseDone', 'PhsDone', 'Ow: ');
var phsClose = new Phase('PhaseClose', 'PhsClose', 'Ow: ');




///TODO  visibility check
//cycle !!?? no



///  all render-functions are just little quick tests
///  simple visibility check
void renderPhaseVisibility() {
  //TODO  visibility check in opera
//  -----  testing other parts visibility
//  some data that is not yet here
//  cycle   no
//  cycleGung();

//  Cycle  class is
//  guard  no
//  Guard  class is
//   print(guardMotto);
  // mission  ok
  //mission ok
  // pole  ok

  var phase = new Phase('Test Phase', 'AB: t-p', 'Owner-me');
  phase.init();
  phase.info('* funny *');

}


//