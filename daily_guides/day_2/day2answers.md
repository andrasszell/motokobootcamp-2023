1:  controlled by canister: r7inp-6aaaa-aaaaa-aaabq-cai
2:  pae4o-o6dxf-xki7q-ezclx-znyd6-fnk6w-vkv5z-5lfwh-xym2i-otrrw-fqe
    16 nodes
    ( Motoko playground )
3:  10 * 1.498 * 1.125 = 16.86 (ref: https://medium.com/dfinity/how-to-stake-icp-tokens-and-earn-rewards-using-the-nns-front-end-dapp-5059130652b7#:~:text=This%20means%20that%20the%20maximum,power%20for%20the%20stake%20committed )
4:  import Nat "mo:base/Nat"; - missing from the beginning 
5: no need of "var" keyword at array def:
    replace : [var Text] -> [Text]
6:  An array is immutable, so this operation is inefficient, and 
    import Array "mo:base/Array"; is missing.
