CREATE Trigger tr_del_purchase BEFORE DELETE ON client FOR EACH ROW
EXECUTE PROCEDURE del_purchase();