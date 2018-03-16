source :: FromDevice
dest :: ToDevice

c :: Classifier(
  36/0035,           //This is to match DNS Query packets
  -);                //Default case

source -> c

c[0] -> Print('DNS Query Packet', 0) -> DCounter -> dest;

c[1] -> Discard;
