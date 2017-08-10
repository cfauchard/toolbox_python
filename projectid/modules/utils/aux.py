def count_words(input_stream):

    wordlist =input_stream
    
    wordfreq = []
    
    for w in wordlist:
        wordfreq.append(wordlist.count(w))

    '''print("String\n" + wordstring +"\n")
    print("List\n" + str(wordlist) + "\n")
    print("Frequencies\n" + str(wordfreq) + "\n")
    print("Pairs\n" + str(dict(zip(wordlist, wordfreq))))'''

    return dict(zip(wordlist, wordfreq)) 