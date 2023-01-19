
module {

public type book = {
        title: Text;
        pages: Nat;
    };

public func create_book(bookname : Text, pagenum : Nat) : async book {
    return ({title = bookname; pages = pagenum});  
};
}