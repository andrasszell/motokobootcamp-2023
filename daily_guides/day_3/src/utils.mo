import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import Int "mo:base/Int";

//import main "main"

module {

// second_maximum(array : [Int]) ->  Int;
public func second_maximum(array : [Int]) :  async Int {
    var sorted_array = Array.reverse(Array.sort(array, Int.compare));
    var i = 0;
    var length = sorted_array.size();
    if(length < 2)
        return sorted_array[0];

    while(sorted_array[i] == sorted_array[i+1]) {
        if(i + 2 == length)
            return sorted_array[i+1];
        i+=1;
    };

    return sorted_array[i+1];
};

//remove_even(array : [Nat]) -> [Nat];
public func remove_even(array : [Nat]) : async [Nat]{
    Array.filter<Nat>(array, func x = x % 2 != 0);    
};

//drop<T> : (xs : [T], n : Nat) -> [T]
public func drop<T>(xs : [T], n : Nat) : [T] {
    let size = xs.size();
    if(size < n)
        return [];
    let newsize = size - n;
    let array : [T] = Array.tabulate<T>(newsize, func i = xs[i+n]);
    return array;
};

}