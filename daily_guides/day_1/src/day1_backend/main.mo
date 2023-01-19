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

  var mycounter = 0;

  public func multiply(n : Nat, m : Nat) : async Nat {
    return n*m;
  };

  public func volume(n : Nat) : async Nat {
    return n*n*n;
  };

  public func hours_to_minutes(n : Nat) : async Nat {
    return n*60;
  };

  public func set_counter(n : Nat) : async () {
    mycounter := n;
  };

  public func get_counter() : async Nat {
    return mycounter;
  };

  public func test_divide(n: Nat, m : Nat) : async Bool {
    if ((n % m) == 0)
      return true
    else
      return false;
  };

  public func is_even(n : Nat) : async Bool {
    if ((n % 2) == 0)
      return true
    else
      return false;
  };

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

  public func find_duplicates(a : [Nat]) : async [Nat] {
    let buffer = Buffer.Buffer<Nat>(0);
    for (element in a.vals()) {
        let sum =
            Array.foldLeft<Nat, Nat>(
                a,
                0, // start the sum at 0
                func(ssf, x) { if(x == element) ssf + 1 else  ssf  } // this entire function can be replaced with `add`!
            );
        if(sum > 1) {
            if(not(Buffer.contains(buffer,element,Nat.equal)))
                buffer.add(element);
        }
    };
    return Buffer.toArray(buffer);
  };

  public func test() : async () {
    var mytext = "cicacca";
    let charnum = await count_character(mytext,'a');
    Debug.print(debug_show(charnum));

    var myarr = [1,2,3,2,3,5,6,7,1];
    let duparr = await find_duplicates(myarr);
    Debug.print(debug_show(duparr));
  };

};
