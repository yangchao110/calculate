//
//  File.swift
//  testcaculater
//
//  Created by tujia on 2022/5/18.
//

import Foundation
@objcMembers
public class Solution : NSObject {
    
    public func insertsort(){
        
        var a = [1,5,3,10,2];
        for i in 0..<a.count {
            for j in 0..<a.count-1-i {
                if a[j] < a[j+1] {
                    let re = a[j];
                    a[j] = a[j+1];
                    a[j+1] = re;
                }
                print("0000");
                print(a);
            }
            print(1111);
            //print(a);
            
        }
        print(2222);
        print(a);
        
    }
    
    
    
    public func lengthOfLongestSubstring(_ s: String) -> Int {
        
        var arr:[Character] = [];
        var index = 0;
        var targetindex = 0;
        for ch in s {
            if !arr.contains(ch) {
                index+=1;
                arr.append(ch);
                if index > targetindex {
                    targetindex = index;
                }
            }else{
                var currentindex = arr.firstIndex { (e) -> Bool in
                    e == ch;
                };
                arr.append(ch);
                arr.removeSubrange(0..<currentindex!+1);
                index = arr.count;
                //            arr.removeAll();
                //            arr.append(ch);
            }
        }
        print(targetindex);
        return targetindex;
    }
    
    func longestPalindrome(_ s: String) -> String {
        let arr :[Character] = s.map { (e) -> Character in
            return e;
        };
        var result : [[Character]] = [];
        var ss:String = "";
        var maxlength = 1;
        var begin = 0;
        for i in 0..<s.count-1{
            if s.count == 1 {
                return s;
            }
            //            arr.removeAll();
            //            arr.append(s.characteratindex(index: i)!);
            for j in i+1..<s.count{
                //                arr.append(s.characteratindex(index:j)!)
                if j-i+1>maxlength && isvalid(arr: arr, left: i, right: j) {
                    result.append(arr);
                    begin = i;
                    maxlength = j-i+1;
                }
            }
        }
        
        return (s as NSString).substring(with: NSMakeRange(begin, maxlength))
        
        
        return ss;
    }
    
    func longestPalindrome2(_ s: String) -> String {
        if s.count < 2 {
            return s;
        }
        var maxlength = 1;
        var begin = 0;
        
        let chararray = s.map { (e) -> Character in
            return e;
        }
        for i in 0..<s.count-1{
            for j in i+1..<s.count{
                if j-i+1>maxlength && isvalid(arr: chararray, left: i, right: j){
                    maxlength = j-i+1;
                    begin = i;
                }
            }
        }
        
        return (s as NSString).substring(with: NSMakeRange(begin, maxlength))
        //return ss;
    }
    
    public func isvalid(arr :[Character],left:Int,right:Int) -> Bool{
        
        var left1 = left;
        var right1 = right;
        while left1<right1 {
            if arr[left1] != arr[right1] {
                return false;
            }
            left1+=1;
            right1-=1;
            
        }
        return true;
    }
    
    public func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var total : [Int] = [];
        total.append(contentsOf: nums1);
        total.append(contentsOf: nums2);
        total.sort();
        if total.count%2 == 0 {
            print(Double((Double)(total[total.count/2 - 1] + total[total.count/2])/2));
            return Double((Double)(total[total.count/2 - 1] + total[total.count/2])/2);
        }else{
            print(Double(total[Int(floor(Double(total.count/2)))]));
            return Double(total[Int(floor(Double(total.count/2)))]);
        }
    }
    
    public func findMedianSortedArrays2(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var nums11:[Int] = [];
        var nums22:[Int] = [];
        
        nums11.append(contentsOf: nums1);
        nums22.append(contentsOf: nums2);
        
        
        if nums11.count > nums22.count {
            let temp = nums11;
            nums11 = nums22;
            nums22 = temp;
        }
        
        let m = nums11.count;
        let n = nums22.count;
        
        let totalleft = (m+n+1)/2;
        
        var left = 0;
        var right = m;
        
        while left<right {
            let i = left + (right - left + 1)/2;
            let j = totalleft - i;
            if nums11[i-1] > nums22[j] {
                right = i - 1;
            }else{
                left = i;
            }
        }
        
        let i = left;
        let j = totalleft - i;
        let nums1leftmax = i == 0 ? Int.min :  nums11[i-1];
        let nums1rightmin = i == m ? Int.max : nums11[i];
        let nums2leftmax = j == 0 ? Int.min : nums22[j-1];
        let nums2rightmin = j == n ? Int.max : nums22[j];
        
        if (m+n)%2 == 1 {
            print(Double(max(nums1leftmax, nums2leftmax)));
            return Double(max(nums1leftmax, nums2leftmax));
        }else{
            print(Double(Double(max(nums1leftmax, nums2leftmax) + min(nums1rightmin, nums2rightmin))/2));
            return Double(Double(max(nums1leftmax, nums2leftmax) + min(nums1rightmin, nums2rightmin))/2);
        }
    }
    
    //        string convert(string s, int numRows) {
    //                if (numRows == 1) return s;
    //
    //                int step = numRows * 2 - 2; // 间距
    //                int index = 0;// 记录s的下标
    //                int len = s.length();
    //                int add = 0; // 真实的间距
    //                string ret;
    //                for (int i = 0; i < numRows; i++) // i表示行号
    //                {
    //                    index = i;
    //                    add = i * 2;
    //                    while (index < len)//超出字符串长度计算下一层
    //                    {
    //                        ret += s[index]; // 当前行的第一个字母
    //                        add = step - add;// 第一次间距是step -2*i，第二次是2*i,
    //                        index += (i == 0 || i == numRows-1) ? step : add; // 0行和最后一行使用step间距，其余使用add间距
    //                    }
    //                }
    //                return ret;
    //            }
    
    
    //z字形排列
    public func zsort(s:String,row:Int)->String{
        if row == 1 {
            return s;
        }
        
        let step = 2*row-2;
        var sarray : String = "";
        let length = s.count;
        var add = 0; //真实间距
        for i in 0..<row {
            //第一行 和 最后一行 步距为step 其他行步距为step - 2*i -- 2i;
            var index = i;
            add = 2*i;
            while index < length {
                // s.index()
                //sarray.append(s.characteratindex(index: index)!)
                sarray.append(Array(s)[index])
                add = step - add;
                index = index + ((i == 0 || i == row - 1) ? step : add);
            }
            //sarray.append(<#T##newElement: Character##Character#>)
        }
        return sarray;
    }
    //        func reverse(x:Int) -> Int {
    //            let isbig = x > 0;
    //            let xx = String(abs(x));
    //            var s = "";
    //            for i in (0...xx.count-1).reversed() {
    //                s.append(xx.characteratindex(index: i)!)
    //            }
    //
    //            let result = isbig ? (Double(s)! < Double(pow(2.0, 31))-1 ? Int(s)! : 0) : (Double(s)! > Double(pow(2.0, 31)) ? 0 : 0-Int(s)!);
    //            print(result);
    //            return result;
    //        }
    
    public  func reverse1(x:Int) -> Int {
        var xx = x;
        print(Int32.max);
        var rev  = 0;
        while xx != 0 {
            
            let digut = xx % 10; //3
            xx = xx/10; //2
            rev = rev * 10 + digut;
            print(rev);
        }
        return (rev > Int32.max || rev < Int32.min) ? 0 : rev
    }
    
    public func stringToInt(s:String) -> Int
    {
        // var isbig = 0;
        var value  = 0;
        var ss = s.trimmingCharacters(in: CharacterSet.whitespaces);
        var symbol : Character = "+";
        if ss.characteratindex(index: 0) == "+" || ss.characteratindex(index: 0) == "-" {
            symbol = ss.characteratindex(index: 0)!;
            ss = String(ss.dropFirst(1))
        }
        
        for ch in ss {
            if Int(String(ch)) == nil {
                break;
            }else{
                
                if (value * 10 + Int(String(ch))! >= Int(Int32.max) && symbol == "+") {
                    //value = symbol == "+" ? 2147483647 : -2147483648;
                    value = Int(Int32.max);
                    return value;
                }else if(value * 10 + Int(String(ch))! >= Int(Int32.max) + 1 && symbol == "-"){
                    value = -Int(Int32.max) - 1
                    return value;
                    //break;
                }else{
                    value = value * 10 + Int(String(ch))!;
                }
            }
        }
        let result = (symbol == "-" ? -value : value);
        print(result);
        return result;
    }
    
    public  func ispalindrome(x:Int) -> Bool {
        var ss = String(x);
        let a = ss;
        var b = "";
        for ch in ss.reversed() {
            b.append(ch);
        }
        return a == b;
    }
    
    public func maxarea(x:[Int])->Int {
        var areas = 0;
        var left = 0;
        var right = x.count - 1;
        while left<right {
            areas = max(areas, (right-left)*min(x[left], x[right]))
            if x[left] > x[right] {
                right = right - 1;
            }else{
                left = left + 1;
            }
        }
        return areas;
    }
    
    //力扣 12
    public func inttoroman(num:Int)->String{
        //            let map = [1:"I",5:"V",10:"X",50:"L",100:"C",500:"D",1000:"M",4:"IV",9:"IX",40:"XL",90:"XC",400:"CD",900:"CM"];
        let thou:[String] = ["", "M", "MM", "MMM"];
        let hun:[String] = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"];
        let tens:[String] = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"];
        let ones:[String] = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
        return thou[num/1000] + hun[num%1000/100] + tens[num%100/10] + ones[num%10];
    }
    
    //力扣 12
    public func inttoroman2(num:Int)->String{
        let map = [[1000:"M"],[900:"CM"],[500:"D"],[400:"CD"],[100:"C"],[90:"XC"],[50:"L"],[40:"XL"],[10:"X"],[9:"IX"],[5:"V"],[4:"IV"],[1:"I"]];
        var result = ""
        var nums = num;
        for dic in map{
            while nums >= dic.keys.first! {
                nums = nums - dic.keys.first!;
                result = result + dic.values.first!;
            }
        }
        return result;
    }
    
    //力扣 13
    public func inttoroman3(s:String)->Int{
        let map = ["M":1000,"CM":900,"D":500,"CD":400,"C":100,"XC":90,"L":50,"XL":40,"X":10,"IX":9,"V":5,"IV":4,"I":1];
        let rule = ["XC":-20,"CM":-200,"CD":-200,"XL":-20,"IX":-2,"IV":-2];
        var result = 0;
        var lastch : Character = Character("o");
        //var nums = num;
        for ch in s {
            
            result = result + map[String(ch)]!;
            if lastch == "X" && (ch == "C" || ch == "L") {
                result = result - 20;
            }
            if lastch == "C" && (ch == "M" || ch == "D") {
                result = result - 200;
            }
            if lastch == "I" && (ch == "X" || ch == "V") {
                result = result - 2;
            }
            lastch = ch;
            
        }
        return result;
    }
    
    //力扣14
    public func longestCommonPrefix(ss:[String]) -> String {
        let shorts = ss.sorted { (s1, s2) -> Bool in
            return s1.count > s2.count;
        }.last;
        var result = "";
        var target = shorts;
        var next = shorts;
        var lastatrget = "";
        for s in ss {
            lastatrget = ""
            while (next ?? "").count > 0 {
                let ch = next!.characteratindex(index: 0);
                next = String(next!.dropFirst(1));
                if s.hasPrefix(result + String(ch!)) {
                    result = result + String(ch!);
                    lastatrget = result;
                    target = result;
                }else{
                    target = lastatrget;
                    break;
                }
            }
            next = target!;
            result = "";
        }
        return target!;
    }
    func Merge5 ( _ pHead1: ListNode?,  _ pHead2: ListNode?) -> ListNode? {
           // write code here
           var newNode = ListNode(0);
           var cur : ListNode? = newNode;
           var cur1 : ListNode? = pHead1;
           var cur2 : ListNode? = pHead2;
           while(cur1 != nil || cur2 != nil){
               if(cur1!.val < cur2!.val){
                   cur?.next = cur1;
                   cur1 = cur?.next;
               }else{
                   cur?.next = cur2;
                   cur2 = cur2?.next;
               }
           }
           if(cur1 != nil){
               cur?.next = cur1;
           }
            if(cur2 != nil){
               cur?.next = cur2;
           }
           return cur;
           
       }
    //力扣 15
    public func threesum(nums:[Int]) -> [[Int]]{
        let sortarray = nums.sorted();
        var result : [[Int]] = [];
        for i in 0..<sortarray.count {
            if(sortarray[i] > 0){
                print(result);
                return result;
            }
            if(i>0 && sortarray[i] == sortarray[i-1]){
                continue;
            }
            var left = i+1;
            var right = sortarray.count-1;
            while left<right {
                let total = sortarray[i] + sortarray[left] + sortarray[right]
                if total > 0 {
                    right = right - 1;
                }else if(total < 0){
                    left = left + 1
                }else{
                    result.append([sortarray[i],sortarray[left],sortarray[right]]);
                    //去重复
                    while left < right && sortarray[left] == sortarray[left + 1]  {
                        left = left + 1;
                    }
                    while left < right && sortarray[right] == sortarray[right - 1]  {
                        right = right - 1;
                    }
                    
                    left = left + 1;
                    right = right - 1;
                }
            }
        }
        return result;
        
    }
    
    //力扣 16
    public func threesumclosest(nums:[Int],target:Int) -> Int{
        let sortarray = nums.sorted();
        //假设第一组是满足条件的初始值
        var minans = nums[0] + nums[1] + nums[2];
        for i in 0..<nums.count {
            var left = i + 1;
            var right = nums.count - 1;
            
            while left<right {
                let ca = sortarray[i] + sortarray[left] + sortarray[right] - target
                if abs(ca)<abs(minans-target){
                    minans = sortarray[i] + sortarray[left] + sortarray[right];
                }
                if ca > 0 {
                    right=right-1;
                }else{
                    left = left + 1
                }
                if ca  == 0 {
                    return target;
                }
            }
        }
        return minans;
    }
    
    //力扣 17
    public func letterCombinations(_ digits: String) -> [String] {
        let map = ["2":["a","b","c"],"3":["d","e","f"],"4":["g","h","i"],"5":["j","k","l"],"6":["m","n","o"],"7":["p","q","r","s"],"8":["t","u","v"],"9":["w","x","y","z"]];
        var chs : [[String]] = [];
        var targetchs: [[String]] = [];
        for ch in digits {
            chs.append(map[String(ch)]!)
        }
        if digits.count == 1 {
            return chs.first!;
        }
        if digits == "" {
            return [];
        }
        var isfirst = true;
        while chs.count > 0 {
            // for ch in chs {
            targetchs.append(getcombinations(a:targetchs.count > 0 ? targetchs.last! : chs[0], b: targetchs.count > 0 ? chs[0] : chs[1]));
            
            if isfirst == false {
                chs.removeFirst();
            }else{
                chs.removeFirst();
                chs.removeFirst();
            }
            isfirst = false;
        }
        return targetchs.last!;
    }
    
    public func getcombinations(a:[String],b:[String]) -> [String] {
        var result :[String] = [];
        for s in a {
            for ss in b {
                result.append(s+ss);
            }
        }
        return result;
    }
    
    //力扣17
    public func letterCombinations1(_ digits: String) -> [String] {
        
        var res:[String] = [];
        if digits.count == 0 {
            return res;
        }
        let map = ["2":"abc","3":"def","4":"ghi","5":"jkl","6":"mno","7":"pqrs","8":"tuv","9":"wxyz"];
        var path : String = "";
        dfs(path: &path, map: map, digits: digits, dept: 0, res: &res)
        return res;
    }
    
    func dfs(path : inout String,map:Dictionary<String,String>,digits:String,dept:Int, res:inout [String]){
        if dept == digits.count  {
            res.append(path)
        }else{
            let digit = digits.characteratindex(index: dept)!
            let str = map[String(digit)];
            for ch in str! {
                //path.append(str!.characteratindex(index: i))
                //path = path + String(str!.characteratindex(index: i)!);
                path = path + String(ch)
                dfs(path: &path, map: map, digits: digits, dept: dept+1, res: &res)
                //(s as NSString).substring(with: NSMakeRange(begin, maxlength))
                path.removeLast()
            }
            
        }
    }
    
    //力扣18
    public func fourSum(nums:[Int],target:Int) -> [[Int]]{
        let sortarray = nums.sorted();
        var result : [[Int]] = [];
        for i in 0..<sortarray.count {
            if i > 0 && sortarray[i] == sortarray [i-1]  {
                continue;
            }
            for j in i+1..<sortarray.count {
                if j > i+1 && sortarray[j] == sortarray [j-1]  {
                    continue;
                }
                var left = j+1;
                var right = sortarray.count - 1;
                while left<right {
                    let num = sortarray[i] + sortarray[j] + sortarray[left] + sortarray[right];
                    if num == target {
                        result.append([sortarray[i],sortarray[j],sortarray[left],sortarray[right]])
                        while left < right && sortarray[right] == sortarray[right - 1] {
                            right = right - 1
                        }
                        while left < right && sortarray[left] == sortarray[left + 1] {
                            left = left + 1
                        }
                        left = left + 1;
                        right = right - 1;
                    }else if(num > target){
                        right = right - 1;
                    }else{
                        left = left + 1;
                    }
                }
            }
            
        }
        return result;
    }
    
    //力扣19
    public func removeNthFromEnd(head: ListNode,n: Int) -> ListNode?{
        var handHead : ListNode? = head;
        if(handHead == nil || handHead?.next == nil){
            return nil;
        }
        var length = 0;
        while handHead != nil {
            length = length + 1;
            handHead = handHead?.next ?? nil ;
        }
        print(head.next ?? nil);
        print(length)
        let dummy = ListNode.init(0, head);
        var cur = dummy;
        for _ in 0..<length-n+1 {
            cur = cur.next!;
        }
        cur.next = cur.next?.next;
        return dummy.next!;
    }
    
    //力扣20
    public func isvalid(s:String) -> Bool{
        var list : [Character] = [];
        for ch in s {
            if ch == "(" {
                list.append(")")
            }else if(ch == "{"){
                list.append("}")
            }else if(ch == "["){
                list.append("]")
            }else if(list.count == 0 || ch != list.popLast()){
                return false;
            }
            
        }
        return list.isEmpty;
    }
    
    public func testmerge(){
        let b = ListNode.init(4, nil)
        let a = ListNode.init(2, b)
        
        let c = ListNode.init(6, nil)
        let d = ListNode.init(3,c)
        
        let list = mergetowlists(list1: a, list2: d)
        print(list)
    }
    
    public func mergetowlists(list1:ListNode?,list2:ListNode?) -> ListNode? {
        var list11 : ListNode? = list1;
        var list22 : ListNode? = list2;
        let dump = ListNode.init(-1)
        var cur = dump;
        while list11 != nil && list22 != nil {
            if list11!.val > list22!.val {
                cur.next = list22;
                cur = cur.next!;
                list22 = list22?.next
                
            }else{
                cur.next = list11;
                cur = cur.next!;
                list11 = list11?.next
            }
        }
        if list11 == nil {
            cur.next = list22;
        }else{
            cur.next = list11;
        }
        return dump.next;
    }
    
    //力扣 22
    public func generateParenthesis(_ n: Int) -> [String] {
        
        var total : [String] = [];
        // let count = n*2;
        generateall(n: n, current:"", result:&total);
        let testa = test(a: 3)
        return total;
    }
    
    func generateall(n:Int,current : String,result: inout [String]){
        // var currents = current;
        if current.count == n*2 {
            if valid(s: current) {
                result.append(current);
            }
            return;
            
        }
        generateall(n: n, current: current + "(", result: &result)
        generateall(n: n, current: current + ")", result: &result)
    }
    
    func test(a:Int) -> Int{
        if a == 1 {
            return 1;
        }
        return a*test(a: a-1);
    }
    
    func valid(s:String) -> Bool {
        var re = 0
        for ch in s {
            if ch == "(" {
                re = re + 1;
            }else{
                re = re - 1;
            }
            
            if re < 0 {
                return false;
                
            }
        }
        return re == 0;
    }
    
    public func testmergeKlists(){
        
        let b = ListNode.init(4, nil)
        let a = ListNode.init(2, b)
        
        let c = ListNode.init(3, nil)
        let d = ListNode.init(1,c)
        
        
        
        Merge(a, d)
    }
    
    //力扣23
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if(lists.count == 0){
            return nil;
        }
        if(lists.count == 1){
            return lists[0] == nil ? nil : lists[0];
        }
        let dump = ListNode.init(-1)
        var currentfirst : ListNode? = lists[0];
        for i in 0..<lists.count-1 {
            currentfirst = mergetowlists(list1: currentfirst, list2: lists[i+1]);
        }
        return currentfirst;
        
    }
    
    public func swappairstest() -> ListNode{
        
        let b = ListNode.init(4, nil)
        let a = ListNode.init(2, b)
        
        let c = ListNode.init(3, a)
        let d = ListNode.init(1,c)
        
        let e = ListNode.init(9, d)
        let z = ListNode.init(7,e)
        let f = ListNode.init(6,z)
        return f;
        swappairs(head: f)
    }
    
    
    
    //力扣24
    public func swappairs(head:ListNode?)->ListNode?{
        let dump = ListNode(-1);
        dump.next = head;
        //cur始终为交换前的一个节点
        var cur : ListNode? = dump;
        while cur?.next != nil && cur?.next?.next != nil {
            let temp = cur?.next;
            let temp1 = cur?.next?.next?.next;
            
            cur?.next = cur?.next?.next;
            cur?.next?.next = temp;
            cur?.next?.next?.next = temp1;
            
            cur = cur?.next?.next;
        }
        
        return dump.next;
    }
    
    public func reverseKGrouptest(){
        
        let b = ListNode.init(4, nil)
        let a = ListNode.init(2, b)
        
        let c = ListNode.init(3, a)
        let d = ListNode.init(1,c)
        
        let e = ListNode.init(9, d)
        let z = ListNode.init(7,e)
        let f = ListNode.init(6,z)
        
        reverseKGroup(f, 3);
    }
    
    //力扣25
    public func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let length = getnodelength(head);
        let dump = ListNode(-1);
        dump.next = head;
        //cur始终为交换前的一个节点
        var cur : ListNode? = head;
        var prev : ListNode? = dump;
        var next : ListNode?;
        
        for _ in 0..<length/k {
            for _ in 0..<k-1 {
                next = cur?.next
                cur?.next = next?.next;
                next?.next = prev?.next;
                prev?.next = next;
            }
            prev = cur;
            cur = prev?.next
        }
        return dump.next;
        
    }
    
    //牛客3
    public func reverseKGroupliu(_ head: ListNode?, _ k: Int) -> ListNode? {
        let length = getnodelength(head);
        let dump = ListNode(-1);
        dump.next = head;
        var pre : ListNode? = dump;
        var cur : ListNode? = head;
        var next : ListNode?
        for _ in 0..<length/k {
            for _ in 0..<k-1 {
                next = cur?.next;
                cur?.next = next?.next;
                next?.next = pre?.next;
                pre?.next = next;
                
            }
            pre = cur;
            cur = pre?.next;
            
        }
        
        return dump.next;
    }
    
    
    //牛客1
    func ReverseList ( _ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head;
        }
        let length = getnodelength(head);
        
        let dump = ListNode(-1);
        dump.next = head;
        //cur始终为交换前的一个节点
        let cur : ListNode? = head;
        let prev : ListNode? = dump;
        var next : ListNode?;
        for _ in 0..<length-1 {
            next = cur?.next;
            cur?.next = next?.next;
            next?.next = prev?.next;
            prev?.next = next;
        }
        return dump.next;
    }
    
    //反转链表
    func reverselist1(head:ListNode?) -> ListNode? {
        var pre : ListNode? = nil;
        var next : ListNode? = nil;
        var cur : ListNode? = head;
        while cur != nil {
            next = cur?.next;
            cur?.next = pre;
            pre = cur;
            cur = next;
            
        }
        return pre;
    }
    
    
    //牛客2
    func reverseBetween ( _ head: ListNode?,  _ m: Int,  _ n: Int) -> ListNode? {
        if head == nil || head?.next == nil {
            return head;
        }
        //let length = getnodelength(head);
        
        let dummy = ListNode(0);
        dummy.next = head;
        var preStart : ListNode? = dummy;
        var start : ListNode? = head;
        for _ in 1..<m {
            preStart = start;
            start = start?.next;
        }
        // reverse
        for _ in 0..<n-m {
            let temp = start?.next;
            start?.next = temp?.next;
            temp?.next = preStart?.next;
            preStart?.next = temp;
        }
        return dummy.next;
    }
    
    func  getnodelength(_ head: ListNode?) -> Int {
        var handHead : ListNode? = head;
        var length = 0;
        while handHead != nil {
            length = length + 1;
            handHead = handHead?.next ?? nil ;
        }
        return length;
    }
    
    func swapairslist(head:ListNode?,k:Int) -> ListNode {
        let dump = ListNode(-1);
        dump.next = head;
        //cur始终为交换前的一个节点
        var cur : ListNode? = dump;
        let isdouble = k%2 == 0;
        while head?.next != nil {
            
            
        }
        return ListNode(1)
    }
    
    
    public  func removeDuplicatestest() -> Int {
        var a = [1,1,2,2,3,4,5,7,7,8,8,8,9]
        return removeDuplicates(&a);
    }
    //力扣26
    public  func removeDuplicates(_ nums: inout [Int]) -> Int {
        var lastnum : Int? = nil;
        
        lastnum = nums.first;
        if nums.count<2 {
            return nums.count;
        }
        var count = 1;
        var i = 0;
        for j in 1..<nums.count {
            
            if lastnum != nums[j] {
                i = i + 1;
                count  = count + 1;
                lastnum = nums[j];
                nums[i] = nums[j];
                //i = i + 1;
            }
            
        }
        return count;
    }
    
    func Merge ( _ pHead1: ListNode?,  _ pHead2: ListNode?) -> ListNode? {
        // write code here
        var p1 = pHead1;
        
        var p2 = pHead2;
        
        let dump = ListNode(-1);
        var cur : ListNode? = dump;
        while p1 != nil && p2 != nil {
            if p1!.val > p2!.val {
                cur?.next = p2;
                cur = cur?.next;
                p2 = p2?.next
            }else{
                cur?.next = p1;
                cur = cur?.next;
                p1 = p1?.next;
            }
            if p1 == nil {
                cur?.next = p2;
            }
            if p2 == nil {
                cur?.next = p1;
            }
        }
        return dump.next;
        
    }
    //力扣27
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        //            var p=0,q=0;
        //            while (q<nums.count){
        //              if(nums[q] != val){
        //                 nums[p]=nums[q];
        //                 p = p + 1;
        //                 q = q + 1;
        //              }else {
        //                 q = q + 1;
        //              }
        //             }
        // return p;
        var p = 0;
        for i in 0..<nums.count {
            if nums[i] != val {
                nums[p] = nums[i];
                p=p+1
            }
        }
        return p;
    }
    
    func strStr(_ haystack: String, _ needle: String) -> Int {
        // var needles = needle;
        if needle.count == 0 {
            return 0;
        }
        let n = haystack.count;
        let m = needle.count;
        if n-m < 0{
            return -1;
        }
        for i in 0...(n-m) {
            var result = true;
            for j in 0..<m {
                
                if haystack.characteratindex(index: i+j) != needle.characteratindex(index: j) {
                    result = false;
                    break;
                }
            }
            if result == true  {
                return i;
            }
        }
        return -1;
        
        
        
    }
    
    public func test(){
        //ReverseList(swappairstest())
        //reverseBetween(swappairstest(), 2, 4)
        //testmergeKlists()
//                    let m = ListNode.init(9, nil)
//                    let g = ListNode.init(4, m)
//                    let f = ListNode.init(5, g)
//                    let e = ListNode.init(5, f)
//                    let b = ListNode.init(7, e)
//                    let a = ListNode.init(7, b)
//
//                    let c = ListNode.init(8, a)
//        removeNthFromEnd1(c, 3)
//        var dic = ["q":1];
//        testFan(dic: &dic)
//        print(dic);
       // let d = ListNode.init(8,nil)
        //            reverselist1(head: d)
        //            var a = [3,3];
        //            removeElement(&a, 5)
        //            "mississippi"
        //            "issipi"
        //            "mississippi"
        //            "issip"
        //strStr("aaa", "aaaa")
        // deleteDuplicates2(d)
        // search([-1,0,3,4,6,10,13], 13)
        //findPeakElement([2,2,2,5,3])
        // removeNthFromEndliu(d, 2)
        //minNumberInRotateArray([1,0,1,1,1]);
        // compare("1.1", "1.01")
        //preorderTraversal(nil);
        //  maxDepth1(getTreeNode());
        //  isValidBST(getTreeNode())
        //let a =  IsBalanced_Solution(getTreeNode())
        // reConstructBinaryTree([1,2,4,7,3,5,6,8], [4,7,2,1,5,3,8,6])
        // permute([1,1,2])
        // maxInWindows([2,3,4,2,6,2,5,1], 3)
       // GetLeastNumbers_Solution([4,5,1,6,2,7,3,8], 8)
       // solve("1-2-3")
        //MoreThanHalfNum_Solution([1,2,3,2,2,2,5,4,2])
        //minNumberDisappeared([-2,1,2,9,7,6,5,3])
       // threeSum1([-4,-2,1,-5,-4,-4,4,-2,0,4,0,-2,3,1,-5,0])
       // trans("This is a sample ", 16)
       // solve("21321", "")
       //solveSum("1", "99")
//        var a = [4,5,6];
//        merge(&a, 3, [1,2,3], 3)
        //merge(<#T##intervals: [Interval]##[Interval]#>)
       // minWindow("XDOYEZODEYXNZ", "OOD")
      //  solveStr("qwert")
        //maxLength([1,2,3,1,2,3,2,2])
        //maxWater([4,5,1,3,2])
        //jumpFloor(7);
       // minCostClimbingStairs([2,5,20])
//        var list = [5,3,7,4,8,1]
//        choiceSort(list: &list)
       // firstCharacterCountSingle(s: "abaccddeeef")
       // findZhiShu();
//        var c : TreeNode? = TreeNode(2, nil, nil)
//        levelOrder2(&c);
        
        var ar = [1,2];
        for i in 0..<ar.count {
            ar.append(i);
            print(ar);
        }
    }
    
    //        //牛客 判断是否有环
    //        func hasCycle ( _ head: ListNode?) -> Bool {
    //                // write code here
    //            var  slow : ListNode? = head;
    //            var fast : ListNode? = head;window
    //            while fast != nil && fast?.next != nil {
    //                slow = slow?.next;
    //                fast = fast?.next?.next
    //                if &slow == &fast {
    //                    return true
    //                }
    //            }
    //            return false;
    //        }
    
    //牛客 链表中环的入口节点
    //        func EntryNodeOfLoop ( _ pHead: ListNode?) -> ListNode? {
    //            // write code here
    //            var dic : Dictionary<ListNode,String> = Dictionary();
    //            var pHead1 = pHead;
    //            while pHead1 != nil {
    //                if dic[pHead1!] != nil{
    //                    return pHead1;
    //                }else{
    //                    dic[pHead1!] = "";
    //                    pHead1 = pHead1?.next;
    //                }
    //
    //            }
    //            return nil;
    //        }
    //链表倒数最后k个节点
    public func FindKthToTail (pHead :ListNode,k : Int) ->ListNode? {
        
        let length = getnodelength(pHead);
        var index = 0;
        var pHeads : ListNode? = pHead;
        if length-k < 0 {
            return nil;
        }
        while index<=length - k {
            if index == length - k {
                return pHeads;
            }
            index = index + 1;
            pHeads = pHeads?.next;
        }
        return nil;
    }
    //牛客 删除链表的倒数第n个节点
    func removeNthFromEndliu ( _ head: ListNode?,  _ n: Int) -> ListNode? {
        // write code here
        
        if head == nil || head?.next == nil {
            return nil;
        }
        let changhead : ListNode? = ListNode(-1, head)
        let length = getnodelength(changhead);
        var cur = changhead;
        var index = 0;
        while index <= length - n - 1 {
            if index == length - n - 1 {
                cur?.next = cur?.next?.next;
                break;
            }
            index = index + 1;
            cur = cur?.next;
        }
        return changhead?.next;
    }
    //牛客 2个链表的第一个公共节点
    func FindFirstCommonNode ( _ pHead1: ListNode?,  _ pHead2: ListNode?) -> ListNode? {
        // write code here
        let head1Length = getnodelength(pHead1);
        let head2Length = getnodelength(pHead2);
        let step = head2Length - head1Length > 0 ? head2Length - head1Length : head1Length - head2Length
        var longerHead = head1Length > head2Length ? pHead1 : pHead2;
        var shorterHead = head1Length > head2Length ? pHead2 : pHead1;
        var index = 0
        
        while index<step {
            longerHead = longerHead?.next;
            index = index + 1;
        }
        
        while longerHead != nil && shorterHead != nil {
            longerHead = longerHead?.next;
            shorterHead = shorterHead?.next;
            if longerHead === shorterHead {
                return longerHead;
            }
        }
        
        return nil;
        
    }
    
    func addInList ( _ head1: ListNode?,  _ head2: ListNode?) -> ListNode? {
        // write code here
        
        var li : [ListNode] = [];
    
        li.contains { e in
            e === head1;
        }
        
        var testHead1 = head1
        var testHead2 = head2;
        
        if testHead1 == nil {
            return testHead2;
        }
        if testHead2 == nil {
            return testHead1;
        }
        testHead1 = reversehead(head: testHead1);
        testHead2 = reversehead(head: testHead2);
        let resultHead = ListNode(-1);
        var cur : ListNode? = resultHead;
        var tem = 0; //进位
        while testHead1 != nil || testHead2 != nil {
            var value = tem;
            if testHead1 != nil {
                value = value + testHead1!.val
                testHead1 = testHead1?.next;
            }
            if testHead2 != nil {
                value = value + testHead1!.val
                testHead2 = testHead2?.next;
            }
            
            tem = value/10;
            
            cur?.next = ListNode(value%10);
            //往后移动一个节点
            cur = cur?.next;
            
        }
        if tem > 0 {
            cur?.next = ListNode(tem)
        }
        return reversehead(head: resultHead.next);
    }
    
    func reversehead(head:ListNode?) -> ListNode? {
        if head == nil {
            return head;
        }
        var pre : ListNode? = nil;
        var cur : ListNode? = head;
        var next : ListNode? = nil;
        while cur != nil {
            next = cur?.next;
            cur?.next = pre;
            pre = cur;
            cur = next;
        }
        return pre;
    }
    
    func sortInList ( _ head: ListNode?) -> ListNode? {
        
        if (head == nil || head?.next == nil) {
            return head;
        }
        let dummy : ListNode? = ListNode(-1, head);
        var sort : ListNode? = dummy;
        while sort?.next != nil {
            var pre : ListNode? = sort;
            var cur : ListNode? = sort?.next;
            var preMin : ListNode? = nil;
            var min : ListNode? = nil;
            while cur != nil  {
                if min == nil ||  cur!.val < min!.val {
                    min = cur;
                    preMin = pre;
                }
                cur=cur?.next;
                pre=pre?.next;
            }
            preMin?.next = min?.next;
            min?.next = sort?.next;
            sort?.next = min;
            sort = min;
        }
        
        return dummy?.next;
    }
    
    func swopNode(pre:ListNode?,left: inout ListNode?,right: inout ListNode?) {
        let next : ListNode? = right?.next;
        left?.next=next;
        right?.next=left;
        pre?.next = right;
    }
    
    //        func isPail ( _ head: ListNode?) -> Bool {
    //               // write code here
    //            var origialHead = head;
    //            var reverse : ListNode? = reversehead(head: head);
    //            while reverse != nil && origialHead != nil {
    //                if reverse?.val != origialHead?.val {
    //                    return false;
    //                }
    //                reverse = reverse?.next;
    //                origialHead = origialHead?.next;
    //            }
    //            return false;
    //        }
    
    func isPail ( _ head: ListNode?) -> Bool {
        
        var fast = head;
        var slow = head;
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next;
            fast = fast?.next?.next;
        }
        slow = reversehead(head: slow);
        fast = head;
        while slow != nil {
            if slow?.val != fast?.val {
                return false;
            }
            slow = slow?.next
            fast = fast?.next
        }
        return true;
    }
    
    func  reversetest1(list : ListNode?) -> ListNode? {
        if list == nil {
            return nil;
        }
        var pre : ListNode? = nil;
        var cur = list;
        var next : ListNode? = nil;
        
        while cur != nil {
            next = cur?.next;
            cur?.next = pre;
            pre = cur;
            cur = next;
        }
        return pre;
        
    }
    
    func oddEvenList ( _ head: ListNode?) -> ListNode? {
        if(head == nil || head?.next == nil){
            return head;
        }
        // 1 2 3 2 1
        let evenHead = head?.next;
        var odd = head;//偶
        var even = head?.next;
        while(even != nil && even?.next != nil){
            odd?.next = even?.next;
            odd = odd?.next;
            even?.next = odd?.next;
            even = even?.next;
        }
        odd?.next = evenHead;
        return head;
    }
    
    func deleteDuplicates ( _ head: ListNode?) -> ListNode? {
        // write code here
        var cur = head;
        var next : ListNode? = nil;
        
        
        while(cur?.next != nil){
            next = cur?.next;
            if(cur?.val == next?.val){
                cur?.next = next?.next;
            }else{
                cur = cur?.next;
            }
        }
        return head;
        
    }
    
    func deleteDuplicates2 ( _ head: ListNode?) -> ListNode? {
        
        var cur = head;
        var next : ListNode? = nil;
        let dump = ListNode(-1, head)
        var pre : ListNode? = dump;
        
        while(cur?.next != nil){
            next = cur?.next;
            if(cur?.val == next?.val){
                let value = cur?.val
                cur = pre;
                while(next != nil && next?.val == value){
                    next = next?.next;
                }
                cur?.next = next;
                cur = cur?.next
            }else{
                pre = cur;
                cur = cur?.next;
            }
            
        }
        return dump.next;
    }
    
    func search ( _ nums: [Int],  _ target: Int) -> Int {
        
        let length = nums.count;
        var i = 0;
        var j = length - 1;
        var mid = (i + j)/2;
        while(i<=j){
            // let mid = nums[mid];
            if(nums[mid] > target){
                j = mid - 1;
                mid = (i+j)/2;
            }else if(nums[mid] < target){
                i = mid + 1;
                mid = (i+j)/2;
            }else{
                return mid;
            }
        }
        return -1;
    }
    
    func Find ( _ target: Int,  _ array: [[Int]]) -> Bool {
        // write code here
        var first = array.first;
        let count = first?.count;
        let rows = array.count - 1;
        var  i : Int = rows;
        var j : Int = 0;
        while(j <= count! - 1 && i >= 0){
            if(array[i][j] > target){
                i = i - 1;
            }else if(array[i][j] < target){
                j = j + 1;
            }else{
                return true;
            }
        }
        return false;
    }
    
    func findPeakElement ( _ nums: [Int]) -> Int {
        
        var pre : Int = nums[0];
        for i in 1..<nums.count {
            if(i+1 < nums.count && nums[i]>pre && nums[i+1]<nums[i] || (nums[i]>pre && i == nums.count - 1)){
                return i;
            }else{
                pre = nums[i];
            }
        }
        return 0;
        
    }
    
    //待定
    func InversePairs ( _ data: [Int]) -> Int {
        // write code here
        let mod = 1000000007;
        
        return 0%mod;
    }
    
    func minNumberInRotateArray ( _ rotateArray: [Int]) -> Int {
        
        var left = 0;
        var right = rotateArray.count - 1;
        while (left < right){
            let mid = (left + right)/2;
            if(rotateArray[mid] < rotateArray[right]){
                right = mid;
            }else if(rotateArray[mid] > rotateArray[right]){
                left = mid + 1;
            }else{
                right = right - 1;
            }
        }
        
        return rotateArray[left];
    }
    
    func compare ( _ version1: String,  _ version2: String) -> Int {
        
        //8.32.21。9.21.01
        let n1 = version1.count;
        let n2 = version2.count;
        var index1 = 0;
        var index2 = 0;
        while(index1 < n1 || index2 < n2){
            var num1 = 0;
            var num2 = 0;
            while(version1.characteratindex(index: index1) != "." && index1 < n1){
                num1 = num1 * 10 + Int(String(version1.characteratindex(index: index1)!))!;
                index1 = index1 + 1;
            }
            
            while(version2.characteratindex(index: index2) != "." && index2 < n2){
                num2 = num2 * 10 + Int(String(version2.characteratindex(index: index2)!))!;
                index2 = index2 + 1;
            }
            if(num1 > num2){
                return 1;
            }
            if(num1<num2){
                return -1;
            }
            index1 = index1 + 1;
            index2 = index2 + 1;
        }
        return 0;
    }
    
    func preorderTraversal ( _ root: TreeNode?) -> [[Int]] {
        let c : TreeNode = TreeNode(2, nil, nil)
        let b : TreeNode = TreeNode(1,nil, nil)
        let d : TreeNode = TreeNode(5,c,b)
        
        let f : TreeNode = TreeNode(7,nil, nil)
        let g : TreeNode = TreeNode(6,nil,nil)
        let e : TreeNode = TreeNode(4, g, f)
        
        
        let a : TreeNode = TreeNode(3, d, e)
        
        
        
        
        var list : [[Int]] = [];
        // preOrder(node: a, list: &list)
        recursive(node: a, list: &list)
        return list;
    }
    
    func levelOrder ( _ root: TreeNode?) -> [[Int]] {
        return [[0]];
    }
    
    func recursive(node:TreeNode?,list:inout [[Int]]){
        
        var que : [TreeNode] = [];
        que.append(node!);
        var isNormal = true;
        while que.count != 0{
            let count = que.count;
            var temp : [Int] = [];
            for i in 0..<count {
                let node = que.removeFirst();
                temp.append(node.val)
                if node.left != nil{
                    que.append(node.left!)
                }
                if node.right != nil{
                    que.append(node.right!)
                }
            }
            isNormal = !isNormal;
            list.append(isNormal ? temp.reversed() : temp)
        }
        
    }
    
    func levelOrder2 ( _ root: inout TreeNode?) -> [[Int]] {
        let c : TreeNode = TreeNode(2, nil, nil)
        let b : TreeNode = TreeNode(1,nil, nil)
        let d : TreeNode = TreeNode(5,c,b)
        
        let f : TreeNode = TreeNode(7,nil, nil)
        let g : TreeNode = TreeNode(6,nil,nil)
        let e : TreeNode = TreeNode(4, g, f)
        
        
        let a : TreeNode = TreeNode(3, d, e)
        root = a;
            // write code here
               if(root == nil){
                   return [];
               }
               var list : [[Int]] = [];
               var que : [TreeNode] = [];
               que.append(root!);
               while(que.count != 0){
                   var temp : [Int] = [];
                   for i in 0..<que.count {
                     let node = que.removeFirst();
                      temp.append(node.val)
                     if(node.left != nil){
                        que.append(node.left!)
                     }
                     if(node.right != nil){
                        que.append(node.right!)
                     }
                   }
                   list.append(temp)
               }
                
            return list;
        }
        
    
    
    
    func preOrder(node:TreeNode?,list:inout [Int]){
        // let list : [Int] = [];
        if(node == nil){
            return;
        }
        //list.append(contentsOf: node?.val);
        list.append(node?.val ?? 0);
        preOrder(node: node?.left, list: &list);
        
        preOrder(node: node?.right, list: &list);
        
    }
    
    func maxDepth ( _ root: TreeNode?) -> Int {
        let c : TreeNode = TreeNode(2, nil, nil)
        let b : TreeNode = TreeNode(1,nil, nil)
        let d : TreeNode = TreeNode(5,c,b)
        
        let f : TreeNode = TreeNode(7,nil, nil)
        let g : TreeNode = TreeNode(6,nil,nil)
        let e : TreeNode = TreeNode(4, g, f)
        
        
        let a : TreeNode = TreeNode(3, d, e)
        //root = a;
        var index = 0;
        var que : [TreeNode] = [];
        que.append(a)
       // que.reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, TreeNode) throws -> Result##(Result, TreeNode) throws -> Result##(_ partialResult: Result, TreeNode) throws -> Result#>)
        while(que.count > 0){
            
            let count = que.count;
            var temp : [Int] = [];
            for i in 0..<count{
                let nood = que.removeFirst();
                temp.append(nood.val);
                if (nood.left != nil){
                    que.append(nood.left!);
                }
                if (nood.right != nil){
                    que.append(nood.right!);
                }
                
            }
            index = index + 1;
            
        }
        return index;
    }
    
    func getTreeNode() -> TreeNode{
        let c : TreeNode = TreeNode(6, nil, nil)
        let b : TreeNode = TreeNode(4,nil, nil)
        let f : TreeNode = TreeNode(5,nil, nil)
        let d : TreeNode = TreeNode(2,b,f)
        
        
        let h : TreeNode = TreeNode(3,c, nil)
        let i : TreeNode = TreeNode(11,nil,nil)
        
        
        let g : TreeNode = TreeNode(12,i,h)
        let e : TreeNode = TreeNode(11, nil, nil)
        
        
        let a : TreeNode = TreeNode(1, d, h)
        return a;
    }
    
    func hasPathSum ( _ root: TreeNode?,  _ sum: Int) -> Bool {
        // write code here
        var summ = sum;
        if(root == nil){
            return false;
        }
        summ = summ - root!.val
        if (summ == 0 && root?.left == nil && root?.right == nil){
            return true;
        }
        return hasPathSum(root?.left, summ) || hasPathSum(root?.right, summ);
    }
    
    func isSymmetrical ( _ pRoot: TreeNode?) -> Bool {
        // write code here
        if(pRoot == nil){
            return true;
        }
        var ar : [TreeNode?] = [];
        ar.append(pRoot?.left);
        ar.append(pRoot?.right);
        while(ar.count > 0){
            let left = ar.removeFirst();
            let right = ar.removeFirst();
            if (left == nil && right == nil){
                continue;
            }
            if(left == nil || right == nil){
                return false;
            }
            if(left?.val != right?.val){
                return false;
            }
            ar.append(left?.left);
            ar.append(right?.right);
            ar.append(left?.right)
            ar.append(right?.left);
        }
        return true;
    }
    
    func maxDepth1 ( _ root: TreeNode?) -> Int {
        if(root == nil){
            return 0;
        }
        let a = maxDepth1(root?.left) + 1
        let b = maxDepth1(root?.right) + 1;
        return max(a, b);
    }
    
    func mergeTrees ( _ t1: TreeNode?,  _ t2: TreeNode?) -> TreeNode? {
        if(t1 == nil){
            return t1;
        }
        if(t2 == nil){
            return t2;
        }
        var result = TreeNode(t1!.val + t2!.val);
        //连接后的树的层次节点
        var q : [TreeNode?] = [];
        //分别的2个树的层次遍历节点
        var q1 : [TreeNode?] = [];
        var q2: [TreeNode?] = [];
        q.append(result)
        q1.append(t1)
        q2.append(t2)
        
        while(q1.count != 0 && q2.count != 0){
            let node = q.removeFirst();
            let node1 = q1.removeFirst();
            let node2 = q2.removeFirst()
            let left1 = node1?.left;
            let left2 = node2?.left;
            let right1 = node1?.right;
            let right2 = node2?.right;
            if(left1 != nil && left2 != nil){
                let leftnode = TreeNode(left1!.val + left2!.val);
                node?.left = leftnode;
                q.append(leftnode);
                q1.append(left1);
                q2.append(left2);
            }else if(left1 != nil){
                node?.left = left1;
            }else{
                node?.left = left2
            }
            if(right1 != nil && right2 != nil){
                let rightnode = TreeNode(right1!.val + right2!.val);
                node?.right = rightnode;
                q.append(rightnode);
                q1.append(right1);
                q2.append(right2);
            }else if(right1 != nil){
                node?.right = right1;
            }else{
                node?.right = right2
            }
        }
        
        return result;
        
        
    }
    
    func Mirror ( _ pRoot: TreeNode?) -> TreeNode? {
        // write code here
        if(pRoot == nil){
            return nil;
        }
        let result = pRoot!;
        var list : [TreeNode] = [];
        list.append(result);
        while(list.count != 0){
            var node = list.removeFirst();
            //                var left = list.removeFirst();
            //                var right = list.removeFirst();
            if(node.left != nil){
                list.append(node.left!)
            }
            if(node.right != nil){
                list.append(node.right!)
            }
            let tmp = node.left;
            node.left = node.right;
            node.right = tmp;
        }
        return result;
    }
    
    func isValidBST ( _ root: TreeNode?) -> Bool {
        
        //装载当前层序节点
        var leftList : [TreeNode?] = [root?.left]
        var rightList : [TreeNode?] = [root?.right]
        var rootList : [TreeNode?] = []
        rootList.append(root)
        // list.append(root);
        let rootvalue = root!.val;
        while(leftList.count != 0 || rightList.count != 0){
            // let node = rootList.removeFirst();
            let leftnode = leftList.count > 0 ? leftList.removeFirst() : nil;
            let rightnode = rightList.count > 0 ? rightList.removeFirst() : nil;
            
            //当前节点的值
            let leftvalue = leftnode?.val;
            let rightValue = rightnode?.val;
            
            if( (leftvalue != nil && leftvalue! >= rootvalue) || (rightValue != nil && rightValue! <= rootvalue)){
                return false;
            }
            if(leftnode?.left != nil){
                leftList.append(leftnode?.left);
                if(leftnode!.left!.val >= leftvalue! || leftnode!.left!.val > rootvalue){
                    return false;
                }
            }
            if(leftnode?.right != nil){
                leftList.append(leftnode?.right);
                if(leftnode!.right!.val <= leftvalue! || leftnode!.right!.val > rootvalue){
                    return false;
                }
            }
            
            if(rightnode?.left != nil){
                rightList.append(rightnode?.left);
                if(rightnode!.left!.val >= rightValue! || rightnode!.left!.val < rootvalue){
                    return false;
                }
            }
            if(rightnode?.right != nil){
                rightList.append(rightnode?.right);
                if(rightnode!.right!.val <= rightValue! || rightnode!.right!.val < rootvalue){
                    return false;
                }
            }
            
        }
        return true;
    }
    
    func isCompleteTree ( _ root: TreeNode?) -> Bool {
        // write code here
        var list : [TreeNode?] = [];
        
        list.append(root)
        var isOver = false;
        while(list.count != 0){
            let node = list.removeFirst()
            if(node == nil){
                isOver = true;
                continue;
            }
            if(isOver == true){
                return false;
            }
            list.append(node?.left)
            list.append(node?.right)
        }
        return true;
        
    }
    
    func IsBalanced_Solution ( _ pRoot: TreeNode?) -> Bool {
        if (pRoot == nil){
            return true;
        }
        return IsBalanced_Solution(pRoot?.left) && IsBalanced_Solution(pRoot?.right) && fabs(Double(deep(node: pRoot?.left) - deep(node: pRoot?.right))) < 2;
    }
    
    public func deep(node:TreeNode?) -> Int{
        if(node == nil){
            return 0;
        }
        return max(deep(node: node?.left), deep(node: node?.left)) + 1;
    }
    
    //二叉搜索树
    func lowestCommonAncestor ( _ root: TreeNode?,  _ p: Int,  _ q: Int) -> Int {
        
        var resultNode = root;
        while(true){
            let value = resultNode!.val;
            if(value > p && value > q){
                resultNode = resultNode?.left
            }else if(value < p && value < q){
                resultNode = resultNode?.right
            }else{
                break;
            }
        }
        return resultNode!.val;
    }
    
    //二叉树
    func lowestCommonAncestor1 ( _ root: TreeNode?,  _ o1: Int,  _ o2: Int) -> Int {
        // write code here
        //简历字典保存各个节点和父节点的对应关系 找出o1的所有父节点 如果和o2或者它的父节点有重合 此节点就是我们要找的
        var map : Dictionary<Int,Int> = Dictionary();
        var list : [TreeNode?] = [];
        map[root!.val] = Int.max;
        list.append(root)
        
        while(!map.keys.contains(o1) || !map.keys.contains(o2)){
            let node = list.removeFirst();
            if(node?.left != nil){
                list.append(node?.left)
                //记录下父节点
                map[node!.left!.val] = node!.val;
            }
            if(node?.right != nil){
                list.append(node?.right)
                //记录下父节点
                map[node!.right!.val] = node!.val;
            }
        }
        //jiluxia
        var list1 : [Int?] = [];
        var mutaO1 = o1;
        var mutaO2 = o2;
        while(map.keys.contains(mutaO1)){
            list1.append(mutaO1);
            mutaO1 = map[mutaO1]!;
        }
        
        //查看o1和他的祖先节点是否包含o2 否者在看是否包含o2的祖先节点
        while(!(list1.contains(mutaO2))){
            mutaO2 = map[mutaO2]!;
        }
        
        return mutaO2;
    }
    
    func reConstructBinaryTree ( _ pre: [Int],  _ vin: [Int]) -> TreeNode? {
        // write code here
        let n = pre.count //前序遍历 中左右
        let m = vin.count //中序遍历 左中右
        if (n == 0 || m == 0){
            return nil;
        }
        var list : [TreeNode] = [];
        let rootNode : TreeNode? = TreeNode(pre[0]);
        var cur = rootNode;
        var  j = 0;
        for i in 1..<n {
            
            if(cur?.val != vin[j]){
                cur?.left = TreeNode(pre[i])
                list.append(cur!)
                cur = cur?.left
            }else{
                j = j + 1;
                while(!(list.count == 0) && list.last?.val == vin[j]){
                    cur = list.removeLast();
                    j = j + 1;
                }
                cur?.right = TreeNode(pre[i]);
                cur = cur?.right
            }
        }
        
        
        
        return rootNode;
    }
    
    //        public int[] solve (int[] xianxu, int[] zhongxu) {
    //            // write code here
    //
    //     }
    
    
    
    
    func permute ( _ num: [Int]) -> [[Int]] {
        
        var list : [[Int]] = [];
        // var count = num.count;
        var nums : [Int] = [];
        var path : [Int] = [];
        var used:[Bool] = [Bool](repeating: false, count: num.count);
        let sortNum = num.sorted { e1, e2 in
            return e1<e2
        }
        for i in 0..<num.count {
            nums.append(sortNum[i])
        }
        permutedfs(list: &list, nums: &nums, path:&path,used: &used)
        
        return list;
    }
    
    func permutedfs(list: inout [[Int]],nums: inout [Int],path: inout [Int],used: inout [Bool]){
        
        if (path.count == nums.count){
            list.append(path)
        }else{
            for i in 0..<nums.count{
                //                    if(path.contains(nums[i])){
                //                        continue;
                //                    }
                if(used[i] == true){
                    continue;
                }
                if(i>0 && nums[i-1]==nums[i] && !used[i-1]){
                    continue;
                }
                used[i]=true;
                path.append(nums[i])
                permutedfs(list: &list, nums: &nums, path: &path,used: &used)
                path.removeLast();
                used[i]=false;
            }
        }
        
    }
    
    func maxInWindows ( _ num: [Int],  _ size: Int) -> [Int] {
        // write code here
        if num.count == 0 || size <= 0 || size > num.count {
            return []
        }
        //2,3,4,2,6,2,5,1
        //let windowsCount = num.count - size + 1;
        //存储当前窗口最大值
        var list : [Int] = [];
        var result : [Int] = [];
        for right in 0..<num.count {
            //如果队列不为空 且当前循环到的数据大于队列的最后一个值 清空队列
            while(list.count != 0 && num[right] > num[list.last!]){
                list.removeLast();
            }
            list.append(right);
            //当前窗口左侧边界的索引
            let left = right - size + 1;
            if(list.first! < left){
                list.removeFirst();
            }
            //当right+1大于等于size时 窗口形成
            if(right + 1 >= size){
                result.append(num[list.first!]);
            }
        }
        
        return result;
    }
    
    func GetLeastNumbers_Solution ( _ input: [Int],  _ k: Int) -> [Int] {
        // write code here
        if input.count < k {
            return []
        }
        if(k==0){
            return [];
        }
        var originalList : [Int] = [];
        for item in input {
            if originalList.count < k {
                originalList.append(item)
            }else{
                let maxValue =  originalList.max()
                if (item < maxValue!){
                    originalList.append(item);
                    originalList.remove(at: originalList.firstIndex(of: maxValue!)!)
                }
            }
        }
        return originalList;
    }
    
    let dic : Dictionary<Character,Int> = ["-": 1, "+": 1, "*": 2, "(": 3];
    func solve ( _ s: String) -> Int {
          // write code here
        var nums : [Int] = [0];
        var ops : [Character] = [];
        let n = s.count;
        var i = 0;
        while i<n {
            let c = s.characteratindex(index: i);
            if(c == "("){
                ops.append(c!);
                i = i + 1;
            }else if(c == ")"){
                while(ops.count > 0){
                    if(ops.last == "("){
                        ops.removeLast()
                        break;
                    }else{
                        cal(num: &nums, ops: &ops)
                    }
                }
                i = i + 1;
            }else{
                if(isNumber(c!)){
                    var u = 0;
                    var j = i;
                    while(j<n && isNumber(s.characteratindex(index: j)!)){
                        u = (u * 10) + Int(String(s.characteratindex(index: j)!))!
                        j=j+1;
                    }
                    nums.append(u);
                    i=j;
                }else{
                    if(i>0 && (s.characteratindex(index: i-1)! == "(" || s.characteratindex(index: i-1)! == "+" || s.characteratindex(index: i-1)! == "-")){
                        nums.append(0);
                    }
                    //新的运算符入栈前 需要更具操作符的优先级 判断是否需要计算 出栈
                    while !ops.isEmpty && ops.last != "(" {
                        let op = ops.last!;
                        if(dic[op]! >= dic[s.characteratindex(index: i)!]!){
                            cal(num: &nums, ops: &ops)
                        }else{
                            break;
                        }
                    }
                    ops.append(s.characteratindex(index: i)!);
                    i=i+1;
                }
            }
        }
        
        // 4.将剩余栈中元素计算完
        while !ops.isEmpty && ops.last != "(" {
            cal(num: &nums, ops: &ops)
        }
        return nums.last ?? 0;
        
      }
    
      func isNumber(_ c: Character) -> Bool {
          switch c {
          case "0","1","2","3","4","5","6","7","8","9":
              return true
          default:
              return false
          }
      }
    
    func cal(num: inout [Int],ops: inout [Character]){
        if(num.count == 0 || num.count < 2){
            return;
        }
        if(ops.count == 0){
            return;
        }
        let b = num.removeLast();
        let a = num.removeLast();
        let op = ops.removeLast();
        var ans = 0;
        if (op == "+"){
            ans = a + b;
        }
        else if (op == "-") {
            ans = a - b;
        }
        else if (op == "*"){
            ans = a * b;
        }
        num.append(ans);
    }
    
    
    func caculate(arr: [String]) -> Int {
          var stack: [Int] = []
          for c in arr {
              if Int(c) != nil {
                  stack.append(Int(c)!)
              }else{
                  if stack.count < 2 {
                      fatalError("arr is invalid")
                  }
                  let num1 = stack.removeLast()
                  let num2 = stack.removeLast()
                  if String(c) == "-" {
                      stack.append(num2 - num1)
                  }
                  if String(c) == "+" {
                      stack.append(num2 + num1)
                  }
                  if String(c) == "*" {
                      stack.append(num2 * num1)
                  }
              }
          }
          if stack.count == 1 {
              return stack.first!
          }
          return Int.min
      }
    
    func twoSum ( _ numbers: [Int],  _ target: Int) -> [Int] {
            // write code here
        var hashResult : Dictionary<Int,Int> = Dictionary();
        for i in 0..<numbers.count {
            let temp = target - numbers[i];
            if(!hashResult.keys.contains(numbers[i])){
                hashResult[temp] = i;
            }else{
                return [hashResult[numbers[i]]!, i];
            }
        }
        return [0];
    }
    
    func MoreThanHalfNum_Solution ( _ numbers: [Int]) -> Int {
            // write code here
        //[1,2,3,2,2,2,5,4,2]
        var hashResult : Dictionary<Int,Int> = Dictionary();
        let middleCount = numbers.count/2;
        for i in 0..<numbers.count {
            if(!hashResult.keys.contains(numbers[i])){
                hashResult[numbers[i]] = 1;
            }else{
                var count = hashResult[numbers[i]]!;
                count = count + 1;
                hashResult[numbers[i]]! = count;
                if(count > middleCount){
                    return numbers[i];
                }
            }
        }
        
        return 0;
          
    }
    
    func FindNumsAppearOnce ( _ array: [Int]) -> [Int] {
        
        var dic = [Int : Int]();
        for item in array {
            if(dic[item] == nil){
                dic[item] = 1;
            }else{
                dic.removeValue(forKey: item)
            }
        }
        let list = dic.keys.sorted();
        return list;
    }
    
    func minNumberDisappeared ( _ nums: [Int]) -> Int {
       // write code here
        var dic = [Int:Int]();
        for item in nums {
            dic[item] = 1;
        }
        var j = 1;
        while(dic.keys.contains(j)){
            j = j + 1;
        }
        return j
      }
    
    func threeSum1 ( _ num: [Int]) -> [[Int]] {
        // write code here
        let nums = num.sorted();
        
        if (num.count < 3){
            return [];
        }
        var list : [[Int]] = [];
        for i in 0..<nums.count-2 {
            if(nums[i] > 0){
                break;
            }
            if(i>0 && nums[i] == nums[i-1]){
                continue;
            }
            var left = i+1;
            var right = nums.count - 1;
            
            while(left<right){
                let result = nums[i] + nums[left] + nums[right]
                if(result > 0){
                    right = right - 1
                }else if(result < 0){
                    left = left + 1;
                }else{
                    list.append([nums[i],nums[left],nums[right]])
                    while(left + 1 < right && nums[left] == nums[left + 1]){
                        left = left + 1;
                    }
                    //指针指向第一个非重复元素 避免重复添加
                   
                    while(right - 1 > left && nums[right] == nums[right - 1]){
                        right = right - 1;
                    }
                    left = left + 1;
                    right = right - 1;
                    
                }
            }
        }
        return list;
    }
    
    func trans ( _ s: String,  _ n: Int) -> String {
        // write code here
       
        var list : [String] = [];
        var result : String = "";
        let s = s + " "
        for c in s{
            if(c == " "){
                list.append(result);
                result = ""
            }else{
                if c.isLowercase{
                    result = result + c.uppercased()
                }else{
                    result = result + c.lowercased()
                }
            }
        }
        var str = "";
        while(list.count > 0){
            str += (list.removeLast() + " ")
        }
        str.removeLast()
        return str;
    }
    
    //纵向扫描
    func longestCommonPrefix1 ( _ strs: [String]) -> String {
        // write code here
        let  rows = strs.count;
        let column = strs[0].count;
        for i in 0..<column {
            let ch = strs[0].characteratindex(index: i);
            for j in 0..<rows{
                if(strs[j].count == i || strs[j].characteratindex(index: i) != ch){
                    return (strs[0] as NSString).substring(with: NSMakeRange(0, i))
                }
            }
        }
        return strs[0];
    }
    
    func solveIp ( _ IP: String) -> String {
      // write code here
        if(isIP4(str: IP)){
            return "IPv4"
        }
        
        if(isIP6(str: IP)){
            return "IPv6"
        }
        
        return "Neither";
    }
    
    func isIP4(str:String) -> Bool{
        let list = str.components(separatedBy: ".");
        if(list.count != 4){
            return false;
        }
        for str in list {
            if(str.hasPrefix("0")){
                return false;
            }
            if(Int(str) == nil){
                return false;
            }
            if(Int(str) != nil && (Int(str)! >= 255 || Int(str)! <= 0)){
                return false;
            }
        }
        return true;
    }
    
    func isIP6(str:String)->Bool{
        
        let list = str.components(separatedBy: ":");
        if(list.count != 8){
            return false;
        }
        for str in list {
            if(str.count > 4 || str.count <= 0){
                return false;
            }
            for ch in str {
                if(!ch.isHexDigit){
                    return false;
                }
            }
        }
        return true;
    }

    //大数相加 不能直接转
    func solveSum ( _ s: String,  _ t: String) -> String {
        // write code here
               var num1 = Array(s)//.map { String($0) }
               var num2 = Array(t)//.map { String($0) }
        
               var result = [Int]()
               var andOne = 0 // 进位标记
        
               var a = 0;
               var b = 0;
               while num1.count > 0 || num2.count > 0 {
                   if(num1.count > 0){
                       a = Int(String(num1.removeLast()))!
                   }else{
                       a = 0;
                   }
                   if(num2.count > 0){
                       b = Int(String(num2.removeLast()))!//Int(tem)
                   }else{
                       b = 0;
                   }
                   let sum = a + b + andOne
                   if sum >= 10 {
                       andOne = 1
                   } else {
                       andOne = 0
                   }
                   result.append(sum % 10)
               }
        
               // 注意最后还有一个进位
               if andOne == 1 {
                   result.append(1)
               }
        
               result = result.reversed()
       
               return result.map { String($0) }.joined(separator: "")
    }
    
    func testFan(dic: inout Dictionary<String,Int>){
        var b = dic;
        b["a"] = 1;
    }
    
    
    func merge ( _ A: inout [Int],  _ m: Int,  _ B: [Int],  _ n: Int) {
           // write code here
        var i = 0;
        var j = 0;
        var p = 0;
        var mergeList : [Int] = Array(repeating: 0, count: m+n);
        while(i<m&&j<n){
            if(A[i]<=B[j]){
                mergeList[p] = A[i];
                p = p + 1;
                i+=1;
            }else{
                mergeList[p] = B[j];
                p = p + 1;
                j+=1;
            }
        }
        while(i<m){
            mergeList[p] = A[i]
            p=p+1;
            i+=1
        }
        while(j<n){
            //mergeList.append(B[j]);
            mergeList[p]=B[j]
            p=p+1;
            j+=1
        }
        for i in 0..<m+n{
            A[i] = mergeList[i];
        }
           
       }
    
    func judge ( _ str: String) -> Bool {
            // write code here
        var i = 0;
        var j = str.count - 1;
        let array = Array(str);
        while(i<j){
            if(array[i] != array[j]){
                return false;
            }else{
                i+=1;
                j-=1;
            }
        }
        return true;
    }
    
    func merge ( _ intervals: [Interval]) -> [Interval] {
          // write code here
        let sortArray = intervals.sorted { e1, e2 in
            return e1.start < e2.start;
        }
        var result : [Interval] = sortArray;
        for i in 1..<result.count {
            
            let preStart = result[i-1].start
            let preEnd = result[i-1].end
            let curStart = result[i].start
            let curEnd = result[i].end
            if(preEnd<curStart){
                result[i] = Interval(preStart, max(preEnd, curEnd));
                result[i-1] = Interval(0, 0);
            }
        }
        result.removeAll { e in
            return e.start == 0;
        }
        return result;
    }
    
    func minWindow ( _ S: String,  _ T: String) -> String {
        // write code here
        
             var left = 0
             var right = 0
             var start = 0
             var minLen = Int.max
             var need: [Character: Int] = [:]
             var window: [Character: Int] = [:]
              
             let S = Array(S)
             let T = Array(T)
             for i in T {
                 if need[i] == nil {
                     need[i] = 1
                 }else{
                     need[i]! += 1
                 }
             }
             var match = 0
              
        while(right<S.count){
            let ch = S[right];
            if(need[ch] != nil){
                if(window[ch] == nil){
                    window[ch] = 1;
                }else{
                    window[ch]!+=1;
                }
                if(window[ch] == need[ch]){
                    match+=1;
                }
            }
            right+=1
            
            while(need.count == match){
                if(right-left < minLen){
                    start = left;
                    minLen = right-left;
                }
                let ch = S[left];
                left+=1;
                if(need[ch] != nil){
                    if(need[ch] == window[ch]){
                        match-=1;
                    }
                    window[ch] = window[ch]! - 1;
                }
            }
        }
        return minLen == Int.max ? "" : String(S[start..<(start + minLen)]);
    }
    
    func solveStr ( _ str: String) -> String {
        // write code here
//        var index = str.count-1;
//        let array = Array(str);
//        var result = "";
//        while(index >= 0){
//            result+=String(array[index])
//            index-=1;
//        }
//        return result;
        //methond2
        var left = 0
        var right = str.count - 1
        var chars = Array(str)
        while(left < right){
            chars.swapAt(left, right)
            left+=1;
            right-=1;
        }
        return String(chars)
    }
    
    
    func maxLength ( _ arr: [Int]) -> Int {
        if arr.count < 2 {
            return 1
        }
        //key是数字值，value是其对应的index
        var map = [Int:Int]()
        var left: Int = -1
        var res: Int = 0
        for i in 0..<arr.count {
            let index = map[arr[i]]
            if(index == nil){
                map[arr[i]] = i;
            }else{
                //记录上一次有重复数字的索引
                left = max(left, index!);
            }
            //计算当前值和最近的一次有重复数字的步距
            res = max(res, i-left)
            map[arr[i]] = i;
        }
        return res
    }
    
    func maxWater ( _ arr: [Int]) -> Int64 {
        var l = 0
        var r = arr.count - 1
        var leftMax = 0
        var rightMax = 0
        var ans:Int64 = 0
        while l <= r {
            if(leftMax < rightMax){
                leftMax = max(leftMax, arr[l])
                ans = ans + Int64((leftMax - arr[l]));
                l+=1;
            }else{
                rightMax = max(rightMax, arr[r])
                ans = ans + Int64((rightMax-arr[r]))
                r-=1;
            }
        }
        return ans
    }
    
    func jumpFloor ( _ number: Int) -> Int {
           // write code here
        if(number==1){
            return 1;
        }
        if(number==2){
            return 2;
        }
        if(number==0){
            return 0;
        }
        return jumpFloor(number-1)+jumpFloor(number-2);
    }
    
    func minCostClimbingStairs ( _ cost: [Int]) -> Int {
        // write code here
        let m = cost.count
        if m == 1 {
            return cost[0];
        }
        //记录以倒数两步为起点到达山顶的最小步数
        var q2 = cost[0]
        var q3 = cost[1]
        var result = 0; //储存以当前为基点到达山顶需要的步数
        for i in 2..<cost.count {
            result = min(q2, q3) + cost[i];
            q2 = q3;
            q3 = result;
        }
        return min(q2, q3);
        
    }
    
    //选择排序
    func choiceSort(list: inout [Int]){
        for i in 0..<list.count-1 {
            var index = i
            for j in i+1..<list.count {
                if(list[index] > list[j]){
                    index = j;
                }
            }
            if(index != i){
                let temp = list[i];
                list[i] = list[index];
                list[index] = temp;
            }
        }
        print(list);
    }
    
    //字符只出此案一次的第一个位置
    func firstCharacterCountSingle(s:String)->Int
    {
        let ar = Array(s);
        var dic = [Character:Int]();
        for i in 0..<ar.count {
            let ch = ar[i];
            if(dic[ch] == nil){
                dic[ch] = i;
            }else{
                dic.removeValue(forKey: ch);
            }
        }
        let index = dic.values.min();
        return index == nil ? 0 : index! + 1;
    }
    
    func findZhiShu()->Bool{
        let a = Int(sqrt(11));
        for i in 2...a {
            if(a%i == 0){
                return false;
            }
        }
        return true;
    }
    
    //合并2个二叉树。都有就求和 否则用其中一个
    func mergeTrees2 ( _ t1: TreeNode?,  _ t2: TreeNode?) -> TreeNode? {
        if(t1 == nil){
            return t2;
        }
        if(t2 == nil){
            return t1;
        }
        let resultNode = TreeNode(t1!.val + t2!.val, nil, nil);
        var queue1 : [TreeNode?] = [];
        var queue2 : [TreeNode?] = [];
        var q : [TreeNode?] = [];
        q.append(resultNode);
        queue1.append(t1);
        queue2.append(t2);
        while(queue1.count > 0 || queue2.count > 0){
            let node = q.removeFirst();
            let t1Node = queue1.removeFirst();
            let t2Node = queue2.removeFirst();
            
            let t1Nodeleft = t1Node?.left;
            let t2Nodeleft = t2Node?.left;
            let t1Noderight = t1Node?.right;
            let t2Noderight = t2Node?.right;
            
            if(t1Nodeleft != nil && t2Nodeleft != nil){
                let leftNodel = TreeNode(t1Nodeleft!.val + t2Nodeleft!.val)
                node?.left = leftNodel;
                q.append(node);
                queue1.append(t1Node)
                queue2.append(t2Node)
               // resultNode.right = t1Noderight?.val + t2Noderight?.val;
            }else if(t1Nodeleft == nil){
                node?.left = t2Nodeleft;
            }else{
                node?.left = t1Nodeleft;
            }
           
            if(t1Noderight != nil && t2Noderight != nil){
                let rightNodel = TreeNode(t1Noderight!.val + t2Noderight!.val)
                node?.right = rightNodel;
                q.append(node);
                queue1.append(t1Node)
                queue2.append(t2Node)
               // resultNode.right = t1Noderight?.val + t2Noderight?.val;
            }else if(t1Noderight == nil){
                node?.right = t2Noderight;
            }else{
                node?.right = t1Noderight;
            }
            
        }
        
        
        
        return resultNode;
    }
    
    func removeNthFromEnd1 ( _ head: ListNode?,  _ n: Int) -> ListNode? {
           // write code here
        var cur = head;
        print("head")
        getNodeList(node: head);
        cur = cur?.next;
        cur = cur?.next;
        print("cur")
        getNodeList(node: cur);
        cur?.next = cur?.next?.next;
        print("cur")
        getNodeList(node: cur);
        print("head")
        getNodeList(node: head);
        return nil;
//            if head == nil || head?.next == nil {
//                   return nil;
//            }
//        getNodeList(node: head);
//            //快慢指针
//           var fast : ListNode? = head;
//           var slow : ListNode? = head;
//           var pre : ListNode? = nil;
//        //slow = nil;
//           for i in 0..<n{
//               fast = fast?.next;
//               if(fast == nil){
//                   return head?.next;
//               }
//           }
//
//           while fast != nil{
//               pre = slow;
//               slow = slow?.next;
//               fast = fast?.next;
//           }
//           pre?.next = slow?.next;
//           return head;
       }
    
    func getNodeList(node : ListNode?){
        var li : [Int] = [];
        var cur = node;
        while(cur != nil){
            li.append(cur!.val);
            cur = cur?.next;
        }
        print(li);
    }
}


 public class Interval {
     public var start: Int
     public var end: Int
     public init(_ start: Int = 0, _ end: Int = 0) {
        self.start = start
        self.end = end
      }
}


public class ListNode {
    public var val: Int = 0
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
}


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int=0, _ left: TreeNode?=nil, _ right: TreeNode?=nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

extension TreeNode : Equatable{
    static public func == (left:TreeNode,right:TreeNode) -> Bool{
        return left.left == right.left && left.right == right.right && left.val == right.val;
    }
}

//extension ListNode : Equatable{
//    static public func == (left:ListNode,right:ListNode) -> Bool {
//        return left.val == right.val && left.next == right.next;
//    }
//}

extension String {
    
    func characteratindex(index:Int) -> Character? {
        var cur = 0;
        for char in self {
            if cur == index {
                return char
            }
            cur+=1
        }
        return nil;
    }
}
