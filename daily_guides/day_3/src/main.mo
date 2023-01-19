// dfx start --background --clean
// dfx stop
// dfx deploy; dfx canister call main test


import Float "mo:base/Float";
import Text "mo:base/Text";
import Char "mo:base/Char";
import Array "mo:base/Array";
import Bool "mo:base/Bool";
import Buffer "mo:base/Buffer";
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";
import Iter "mo:base/Iter";
import List "mo:base/List";
import utils "utils";
import book "book";



actor {

  public type book = book.book;
  var mybooklist = List.nil<book>();

  func add_book(mb : book): () {
    mybooklist := List.push<book>(mb, mybooklist);
  };

  func get_book(): [book] {
    return List.toArray<book>(mybooklist)
  };

  public func test() : async () {
    //var inparray = [6,7,6,8,8,1,5,1,3,7];
    var inparray1 = [1,1,1,1,1,1,2];
    var q1num = await utils.second_maximum(inparray1);
    Debug.print(debug_show(inparray1));
    Debug.print(debug_show(q1num));

    var inparray2 = [6,7,6,8,8,1,5,1,3,7];
    var q2vec = await utils.remove_even(inparray2);
    Debug.print(debug_show(inparray2));
    Debug.print(debug_show(q2vec));

    //var inparray3 = [6,7,6,8,8,1,5,1,3,7];
    var inparray3 = ["wq","rt","hg","longger"];
    var q3vec = utils.drop<Text>(inparray3, 2);
    Debug.print(debug_show(inparray3));
    Debug.print(debug_show(q3vec));

    var newbook = await book.create_book("First",100000);

    add_book(newbook);
    Debug.print(debug_show(get_book()));

  };

};
