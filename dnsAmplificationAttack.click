source :: FromDevice                                                                              
dest :: ToDevice                                                                                   
                                                                                                  
c1::Classifier(                                               
  34/0035,           //This is to match DNS Response packets
  -);                //Default case                                                            

c2::CheckLength(100); //Check the size of DNS Response packets                          
                                                                                                  
source -> c1                                                                                       
                                                                                                  
c1[0] -> Print('DNS Response Packet', 0) -> c2;
c1[1] -> dest;                                                                                     
                                                                                                  
c2[0] -> Print('Legitimate Packet') -> dest;                                              
c2[1] -> Print('Suspicious packets') -> Discard;

