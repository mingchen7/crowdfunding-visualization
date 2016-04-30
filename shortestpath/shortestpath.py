'''
Created on Feb 15, 2015

@author: mingchen7
'''

import datetime
import os
import csv
import time
import operator
import copy

def ShortestPath(nodes,network,start):
    NumNodes = len(nodes)
    C = FindMaxCost(network) # find the maximum cost for arcs    
    Bucks = {}
    dist = {} # d[i], save SP distance to
    S_tmp = nodes # temporary labeling set
    S_perm= [] # permanent labeling set
            
    for i in range(C+1):
        Bucks[i] = [] # list to store nodes
    
    for node in nodes:
        dist[node] = 99999 # infinite
    
    # start of SP algorithm    
    
    # initial the first iteration 
    Bucks[0].append(start) # set-up the first node in bucks
    # S_perm.append(start) # permanently label first node
    dist[start] = 0 
    pointer = 0
    
    while len(S_perm) < NumNodes:
        pointer = FindClosestNonEmptyBuck(Bucks, pointer, C)  # always find the cloesest non-empty buck
        if(pointer == -1):
            print "All bucks are empty!"
            return dist
        
        while(len(Bucks[pointer]) > 0): 
            node = Bucks[pointer].pop(0)
            print node
            S_perm.append(node) # permanently label this node
            S_tmp.remove(node) # remove this node from temporary list
                        
            for toNode in network[node]:
                if(network[node][toNode] >= 0): # connected, positive cost
                    cost = network[node][toNode]
                    if(dist[toNode] > cost + dist[node]): # need to update
                        if(dist[toNode] != 99999): # not infinite
                            preIdx = dist[toNode] % (C+1)
                            Bucks[preIdx].remove(toNode) # remove from older buck
                            
                        dist[toNode] = dist[node] + cost #                    
                        idx = dist[toNode] % (C+1) # calcualte new idx for buck
                        Bucks[idx].append(toNode) # move to new buck
                    
    return dist        
                            
def FindClosestNonEmptyBuck(Bucks, pointer, C):
    tmp = pointer
    while(tmp != ((pointer + C) % (C+1)) ):  # last buck before the pointer
        if(len(Bucks[tmp]) > 0): # found non-empty bucks
            return tmp
        else: #update temp
            if(tmp == C):
                tmp = 0
            else:
                tmp = tmp + 1
    
    return -1 # all the bucks are empty
    
def FindMaxCost(network):
    maxCost = 0
    tmp = 0
    for fromNode in network:
        for toNode in network:
            tmp = network[fromNode][toNode]
            if(tmp >= maxCost):
                maxCost = tmp
    
    return maxCost


def Dijkstra(network, source, nodes):
    Q = copy.deepcopy(nodes)
    numNodes = len(Q)
    dist = {}
    prev = {}
    
    for node in Q:
        dist[node] = 99999
        prev[node] = -1

    dist[source] = 0

    while len(Q) > 0:
        distance = 999999
        u = 0 # initialize u

        # find the u with minimum distance
        for node in Q:
            if dist[node] < distance:
                distance = dist[node]
                u = node

        Q.remove(u)
        
        for v in network[u]:
            if (v in Q) and (network[u][v] >= 0):
                alt = dist[u] + network[u][v]
                if alt < dist[v]:
                    dist[v] = alt
                    prev[v] = u

    return dist, prev


# read network configuration
FileName = 'states adjacency matrix.dat'

if(os.path.isfile(FileName)):
    f1 = open(FileName,'r')
else:
    print "network file is not found!"

Nodes = []
Network = {}

row_num = 1

# reading data from file
for line in f1:
    row = line.split()
    if(row_num == 1): #first row
        # reading nodes
        for node in row:
            Nodes.append(int(node))
        row_num = row_num + 1
                
    else: # >= second row
        fromNode = row_num - 1
        Network[fromNode] = {} # 
        col = 0
        for cost in row:
            toNode = Nodes[col]
            Network[fromNode][toNode] = int(cost)
            col = col + 1
            
        row_num = row_num + 1

states = {}
with open('state order.csv', 'rb') as f:
    reader = csv.reader(f)
    for row in reader:
        num = int(row[0])
        state = row[1]        
        states[num] = state

with open('distance.csv', 'a') as f:
    writer = csv.writer(f)

    for source in range(1,51):        
        dist, prev = Dijkstra(Network, source, Nodes)
        from_state = states[source]        
        print from_state

        for node in dist:            
            to_state = states[node]            
            writer.writerow([from_state, to_state, dist[node]])


