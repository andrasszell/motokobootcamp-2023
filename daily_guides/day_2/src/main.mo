import Float "mo:base/Float";
import Text "mo:base/Text";
import Char "mo:base/Char";
import Array "mo:base/Array";
import Bool "mo:base/Bool";
import Buffer "mo:base/Buffer";
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";
import Iter "mo:base/Iter";

actor {

  public func average_array(array : [Int]) : async Float {
    var sum : Float = 0;
    var cntr : Float = 0;
    for (element in array.vals()) {
        sum += Float.fromInt(element);
        cntr += 1;
    };

    if(cntr != 0)
      return sum/cntr;

    return 0;
  };

  public func count_character(t : Text, c : Char) : async Nat {
    //let array : [Char] = Array.tabulate<Nat>(4, func i = i * 2);
    let array = Iter.toArray(Text.toIter(t));
    return (Array.filter<Char>(array,func x = x == c)).size();
  };

  public func factorial(n : Nat) :  async Nat {
    let array : [Nat] = Array.tabulate<Nat>(n, func i = i + 1);
    let prod =
            Array.foldLeft<Nat, Nat>(
                array,
                1, // start the prod at 1
                func(sumSoFar, x) = sumSoFar * x 
            );    
    return prod;
  };

  public func number_of_words(t : Text) : async Nat {
    let array = Iter.toArray(Text.split(t, #char ' ' ));
    return array.size();
  };

  public func find_duplicates(a : [Nat]) : async [Nat] {
    let buffer = Buffer.Buffer<Nat>(0);
    for (element in a.vals()) {
        let sum =
            Array.foldLeft<Nat, Nat>(
                a,
                0, // start the sum at 0
                func(ssf, x) { if(x == element) ssf + 1 else  ssf  } // this entire function can be replaced with `add`!
                //func(ssf, x) ssf + (x == element)}
            );
        if(sum > 1) {
            if(not(Buffer.contains(buffer,element,Nat.equal)))
                buffer.add(element);
        }
    };
    return Buffer.toArray(buffer);
  };

  public query func convert_to_binary(n : Nat) : async  (Text) {
    var outbin = "";
    var dummy = n;

    while (dummy > 0) {
      outbin := Nat.toText(dummy % 2) # outbin;
      dummy:=dummy / 2;
    };

    if(dummy == n)
      return "0";

    return outbin;

  };

  public func test() : async () {
    var mytext = "cicacca";
    let charnum = await count_character(mytext,'a');
    Debug.print(debug_show(mytext));
    Debug.print(debug_show(charnum));

    //var myarr = [1,2,3,2,3,5,6,7,1];
    var myarr = [10,5,12,18,5,13,10];
    let duparr = await find_duplicates(myarr);
    Debug.print(debug_show(myarr));
    Debug.print(debug_show(duparr));

    var mytext2 = "als ftr nht, fg";
    let wordnum = await number_of_words(mytext2);
    Debug.print(debug_show(mytext2));
    Debug.print(debug_show(wordnum));

    var mynum = 16;
    let mybin = await convert_to_binary(mynum);
    Debug.print(debug_show(mynum));
    Debug.print(debug_show(mybin));

  };

};
