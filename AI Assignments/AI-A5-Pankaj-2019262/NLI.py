import nltk
import warnings
import numpy as np
import pandas as pd
from nltk.corpus import *
import sklearn
from nltk.tokenize import *
import string
from nltk.stem import WordNetLemmatizer
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords


class NLI:
    wordlist = []
    inplist = []
    stopWords = set(stopwords.words('english'))
    wordnet_lemmatizer = WordNetLemmatizer()

    def __init__(self):
        nltk.download('omw-1.4')
        nltk.download('stopwords')
        nltk.download('punkt')
        nltk.download('wordnet')
        warnings.filterwarnings('ignore')
        NLI.wordlist = ['python', 'programming', 'ml', 'database', 'advanceprogramming',
                        'probability', 'discreetmaths', 'cn', 'electronics', 'cryptography']

    def make_list(self):

        print("What have you done till now and interests ?\n")
        inp1 = input()
        text = inp1.lower()
        for sgn in string.punctuation:
            text = text.replace(sgn, ' ')
        text = NLI.wordnet_lemmatizer.lemmatize(text)

        tok1 = word_tokenize(text)
        for wod in tok1:
            if wod not in NLI.stopWords:
                NLI.inplist.append(wod)

        f = open("facts.txt", 'w')

        for key in NLI.wordlist:
            if key in NLI.inplist:
                str = "yes('"+key+").\n"
                f.write(str)
            else:
                str = "no('"+key+").\n"
                f.write(str)

        f.close()
        self.ai()
        self.DE()
        self.IS()
        self.mc()

    def ai(self):
        file = open("facts.txt", 'a')
        file.write("ai(")
        choice = input(
            "Are you interested in Artificial Intelligence? Enter yes/no ")
        file.write(choice)
        file.write(").\n")
        file.close

    def mc(self):
        file = open("facts.txt", 'a')
        file.write("mc(")
        choice = input("Are you interested in Mobile Computing? Enter yes/no ")
        file.write(choice)
        file.write(").\n")
        file.close()

    def IS(self):
        file = open("facts.txt", 'a')
        file.write("is(")
        choice = input(
            "Are you interested in Information Security? Enter yes/no ")
        file.write(choice)
        file.write(").\n")
        file.close()

    def DE(self):
        file = open("facts.txt", 'a')
        file.write("de(")
        choice = input("Are you interested in Data Engineering? Enter yes/no ")
        file.write(choice)
        file.write(").\n")
        file.close()


if __name__ == "__main__":
    nlp = NLI()
    nlp.make_list()
