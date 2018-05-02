#all python 3 :)

#written in python 3 b/c no js option
#don't remember which problem I did this for...
	def computeDifference(self):
		self.maximumDifference = abs(max(self.__elements) - min(self.__elements))

#https://www.hackerrank.com/challenges/py-if-else/problem
if __name__ == '__main__':
	n = int(input())
	if n%2 != 0:
		print('Weird')
	elif n%2 == 0 and n>=2 and n<=5:
		print('Not Weird')
	elif n%2 == 0 and n>=6 and n<=20:
		print('Weird')
	elif n%2 == 0 and n>20:
		print('Not Weird')

#https://www.hackerrank.com/challenges/python-arithmetic-operators/problem
if __name__ == '__main__':
	a = int(input())
	b = int(input())
	print(a+b)
	print(a-b)
	print(a*b)

#https://www.hackerrank.com/challenges/python-division/problem
if __name__ == '__main__':
    a = int(input())
    b = int(input())
    print(a//b)
    print(a/b)

#https://www.hackerrank.com/challenges/python-loops/problem
if __name__ == '__main__':
    n = int(input())
    for i in range(n):
        print(i*i)

#https://www.hackerrank.com/challenges/write-a-function/problem
def is_leap(year):
    leap = False
    
    if year % 4 == 0 and (year % 100 != 0 or year % 400 == 0):
        leap = True
            
    return leap

#https://www.hackerrank.com/challenges/python-lists/problem
if __name__ == '__main__':
    N = int(input()); L = []
    for i in range(N):
        cmd = input().strip().split()
        if cmd[0] == 'insert':
            L.insert(int(cmd[1]),int(cmd[2]))
        elif cmd[0] == 'print':
            print(L)
        elif cmd[0] == 'remove':
            L.remove(int(cmd[1]))
        elif cmd[0] == 'append':
            L.append(int(cmd[1]))
        elif cmd[0] == 'sort':
            L.sort()
        elif cmd[0] == 'pop':
            L.pop()
        else:
            L.reverse()

#https://www.hackerrank.com/challenges/python-tuples/problem
if __name__ == '__main__':
    n = int(input())
    s = input().split()
    sTuple = []
    for i in range(n):
        sTuple.append(int(s[i]))
    print(hash(tuple(sTuple)))

#https://www.hackerrank.com/challenges/list-comprehensions/problem
print([[i,j,k] for i in range(x+1) for j in range(y+1) for k in range (z+1) if( (i+j+k) != n)])