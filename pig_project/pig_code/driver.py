if __name__=='__main__':
   from org.apache.pig.scripting import Pig
   import sys
   P=Pig.compileFromFile('/home/course/lian9478/task3.pig');
   params={};
   for i in range(int(sys.argv[1])):
       if i==0:
          out='/home/course/lian9478/HW4-old_twitter_account_rank.csv'
       else: 
          out="out/pagerank_data_"+str(i+1)
       params['doc_in']=out;
       params['doc_out']="out/pagerank_data_"+str(i+2);
       bound = P.bind(params);
       bound.runSingle(); #this is to do it one by one instead of parallel
       #so you can call this driver like this
       #pig -x local -embedded jython driver.py 20
