import os
import csv
import unicodecsv
import nltk
import operator
import codecs
import numpy as np
from os.path import dirname, abspath
from nltk.sentiment.vader import SentimentIntensityAnalyzer
from nltk import tokenize

def avg_scores(text):
	compound = 0.0
	neg = 0.0
	neu = 0.0
	pos = 0.0
	sent_count = 0
	sentences = tokenize.sent_tokenize(essay)
	for sentence in sentences:
		ss = sid.polarity_scores(sentence)							
		compound = compound + ss['compound']
		neg = neg + ss['neg']
		neu = neu + ss['neu']
		pos = pos + ss['pos']
		sent_count = sent_count + 1
	
	if sent_count > 0:
		compound = compound / sent_count
		neg = neg / sent_count
		neu = neu / sent_count
		pos = pos / sent_count	

	return (compound, neg, neu, pos)


if __name__ == '__main__':
	firstline = True
	row_count = 1
	sid = SentimentIntensityAnalyzer()

	with open('ESSAYS_TX.csv', 'r') as f:
		reader = unicodecsv.reader(f)
		for row in reader:
			if firstline:
				firstline = False
				continue

			print "row #%d" % row_count
			project_id = row[0]
			teacher_id = row[1]
			title = row[2]
			need_statement = row[4]			
			essay = row[5]
			impact_letters = row[7]
			
			compound, neg, neu, pos = avg_acores(essay)			

			with open('ESSAYS_SENTIMENT_TX.csv', 'a') as f_write:
				writer = unicodecsv.writer(f_write)
				writer.writerow([project_id, teacher_id, title, compound, neg, neu, pos])

			row_count = row_count + 1
			
