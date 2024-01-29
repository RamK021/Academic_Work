'''
WHEN THINGS GO WRONG
* y = x/z, but z has value 0
* y = int(s), but string s is not a valid integer
* y = 5*x, but x does not have a value
* y = l[i], but i is not a valid index for list l
* Try to read from a file, but the file does not exist
* Try to write to a file, but the disk is full

syntax:
try:
    ... <- Code where error may occur
except IndexError:
    ... <- What to do if IndexError occurs
except (NameError, KeyError):
    ... <- Common code to handle multiple errors
except:
    ... <- Catch all other exceptions
else:
    ... <- Execute if try terminates normally, no errors

'''

score = {'dhawan':[22, 45], 'kohli':[200, 24]}
def addScore(b, s):
    '''
    # Traditional approach:
    if b in score.keys():
        score[b].append(s)
    else:
        score[b] = [s]
    '''
    try:
        score = score[b].append(s)
    except KeyError:
        print(f"KeyError: Key '{b}' is not exist!")


def nsum():
    while True:
        try:
            n = input('Enter a number:')
            x = int(n)
            break
        except ValueError:
            print("Not a number. Try again!")

    print("sum:",(x*(x+1))//2)

nsum()






