CREATE Function del_purchase() returns trigger as $$
BEGIN
if (select count(*) from purchase where purchase.ID_Client=OLD.ID_Client)>0
then
delete from purchase where purchase.ID_Client=OLD.ID_Client;
end if;
return OLD;
END;
$$LANGUAGE plpgsql;