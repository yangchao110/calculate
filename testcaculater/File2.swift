//
//  File2.swift
//  testcaculater
//
//  Created by chao yang on 2022/7/22.
//

import Foundation
@objcMembers
public class SolutionTwo: NSObject {
    
    var count = 0;
    var map : [Int:ListNode2] = [:];
    var list : DoubleList = DoubleList();
    
    public init(count:Int) {
        self.count = count;
    }
    
    
    func test() {
        set(key: 1, value: 1)
        set(key: 2, value: 2)
        get(key: 1)
        set(key: 3, value: 3)
        get(key: 2)
        set(key: 4, value: 4)
        get(key: 1)
        get(key: 3)
        get(key: 4)
    }
    
    func get(key:Int)->Int{
        if(map[key] == nil){
            return -1;
        }else{
            let node2 = map[key];
            list.remove(node: node2!);
            list.addAtFirst(node: node2!);
            return node2!.value;
        }
    }
    
    func set(key:Int,value:Int){
        if let node = map[key]{
            list.remove(node: node);
        }
        
        let n = ListNode2(key, value);
        list.addAtFirst(node: n);
        map[key] = n;
        
        if(list.size > count){
            let last = list.removelast();
            map.removeValue(forKey: last!.key);
        }
    }
    
}

public class ListNode2 {
    public var key: Int = 0
    public var value : Int = 0;
    public var next: ListNode2?
    public var pre : ListNode2?
  
    public init(_ key: Int, _ value: Int) { self.key = key; self.value = value; }
    
}

public class DoubleList{
    var size = 0;
    let head: ListNode2 = ListNode2(0,0);
    let tail: ListNode2 = ListNode2(0,0);
        
        init(){
            head.next = tail;
            tail.pre = head;
        }
        
        func addAtFirst(node: ListNode2){
            let first = head.next;
            first?.pre = node;
            node.next = first;
            
            node.pre = head;
            head.next = node;
            
            size = size + 1;
        }
        
        func remove(node:ListNode2){
            node.pre?.next = node.next;
            node.next?.pre = node.pre;
            
            size = size - 1;
        }
        
        func removelast() -> ListNode2?{
            if(tail.pre != nil && size > 0){
                let a = tail.pre!;
                remove(node: a);
                return a;
            }else{
                return nil;
            }
        }
        
        func sizeOf() -> Int {
            return size
        }
}
