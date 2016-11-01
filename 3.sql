ALTER table purchase ADD Foreign key (ID_Client) references client;
ALTER table purchase ADD Foreign key (ID_Item) references item;