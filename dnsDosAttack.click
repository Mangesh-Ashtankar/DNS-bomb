source :: FromDevice                                                                              
dest :: ToDevice                                                                                   
                                                                                                  
c1::Classifier(                                                                                   
  36/0035,           //This is to match DNS Query packets                                          
  -);                //Default case        

c2::Classifier(44/0100, -); // Check for recursive DNS query message                                                                                                                                
source -> c1                                                                                                                                                                                         
c1[0] -> Print('DNS Query Packet', 0) -> c2;                                          
c1[1] -> dest;

c2[0] -> Print('Recursive DNS Query Requested. Possibility of DOS Attack. Hence discarding') -> Discard;
c2[1] -> dest;
