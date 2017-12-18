//https://www.hackerrank.com/challenges/bon-appetit
function bonAppetit(n, k, b, ar) { //n=# of items;k=item avoided;b=charged amt;ar = array of prices
    var total = 0 - ar[k],
        str;
    for(i in ar) {
        total+= ar[i]
    }
    return str = total/2 >= b ? 'Bon Appetit' : b- total/2;  
}

//https://www.hackerrank.com/challenges/equality-in-a-array
function processData(input) {
    var arr = input.split('\n')[1].split(' '),
        obj = {},
        current,
        largest = 0;
    for(i in arr) {
        current = arr[i];
        obj[current] ? obj[current]++ : obj[current] = 1;
        largest = obj[current] > largest ? obj[current] : largest;
    }
    console.log(arr.length - largest);
} 

//https://www.hackerrank.com/challenges/30-inheritance/problem
class Student extends Person {
    /*  
    *   Class Constructor
    *   
    *   @param firstName - A string denoting the Person's first name.
    *   @param lastName - A string denoting the Person's last name.
    *   @param id - An integer denoting the Person's ID number.
    *   @param scores - An array of integers denoting the Person's test scores.
    */
    // Write your constructor here
    constructor(firstName, lastName, id, scores) {
        super(firstName,lastName,id);
        this.scores = scores;
    }
    /*  
    *   Method Name: calculate
    *   @return A character denoting the grade.
    */
    // Write your method here
    calculate() {
        var length = this.scores.length;
        var avg = this.scores.reduce(function(a,b) {
            return a+b;
        }) / length;
        var grade = avg >= 90 && avg <=100 ? 'O' : avg >= 80 ? 'E' : avg >= 70 ? 'A' : avg >= 55 ? 'P' : avg >= 40 ? 'D' : 'T';
        return grade;
    }
}

//https://www.hackerrank.com/challenges/30-abstract-classes
class MyBook extends Book {
    constructor(title,author,price) {
        super(title,author)
        this.price = price;
    }
    
    display() {
        console.log('Title: ' + this.title);
        console.log('Author: ' + this.author);
        console.log('Price: ' + this.price);
    }
}