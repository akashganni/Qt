import platform
import os
import time

if platform.system() == 'Windows':
    import winsound
    beep = winsound.Beep
else:
    def beep(freq, time):
        os.system('play -nq -t alsa synth {} sine {}'.format(time, freq))


def morse(text):
    try:
        t = ''
        n = 1
        text = text.lower().split()
        for i in text:
            if n == len(text):
                t = t + i
            else:
                t = t + i + ' '
            n += 1
        del n, text
        ls = {'a': '.-', 'b':'-...', 'c': '-.-.', 'd': '-..', 'e': '.', 'f': '..-.', 'g': '--.',
              'h': '....', 'i': '..', 'j': '.---', 'k': '-.-', 'l': '.-..', 'm': '--', 'n': '-.',
              'o': '---', 'p': '.--.', 'q': '--.-', 'r': '.-.', 's': '...', 't': '-', 'u': '..-',
              'v': '...-', 'w': '.--', 'x': '-..-', 'y': '-.--', 'z': '--..', ' ': ' / ', '0': '-----',
              '1': '.----', '2': '..---', '3': '...--', '4': '....-', '5': '.....', '6': '-....',
              '7': '--...', '8': '---..', '9': '----.', '&': '.-...', "'": '.----.', '@': '.--.-.',
              ')': '-.--.-.', '(': '-.--.', ':': '---...', ',': '--..--', '=': '-...-', '!': '-.-.--',
              '.': '.-.-.-', '-': '-....-', '+': '.-.-.', '"': '.-..-.', '?': '..--..', '/': '-..-.'}
        l = len(t)
        n = 1
        m = ''
        for i in t:
            if n == l:
                m = m + ls[i]
            else:
                if t[n] == ' ' or t[n-1] == ' ':
                    m = m + ls[i]
                else:
                    m = m + ls[i] + ' '
            n += 1
        del l, n, ls, t
        return m
    except AttributeError:
        return '[+] Enter as a String'
    except Exception:
        return 'Unknown Error'


def sound(code, freq=550, wpm=20):
    try:
        code = str(code)
        freq = int(freq)
        t = int(1200/int(wpm))
        if platform.system() != 'Windows':
            t = t/1000
        print(code)
        n = 1
        l = len(code)
        for i in code:
            if n == l:
                if i == '.':
                    beep(freq, t)
                if i == '-':
                    beep(freq , (3*t))
            else:
                if code[n] == ' ' or code[n-1] == ' ':
                    if i == '.':
                        beep(freq, t)
                    if i == '-':
                        beep(freq , (3*t))
                    if i == ' ':
                        time.sleep((3*t)/1000)
                    if i == '/':
                        time.sleep(t/1000)
                else:
                    if i == '.':
                        beep(freq, t)
                        time.sleep(t/1000)
                    if i == '-':
                        beep(freq , (3*t))
                        time.sleep(t/1000)
            n += 1
        del n, l, t, code, freq, wpm
    except ValueError:
        print('[+] Should enter a integer value for Frequency or WPM')
    except Exception as e:
        print(e)
