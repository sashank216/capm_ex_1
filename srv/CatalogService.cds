using { anubhav.db.master, anubhav.db.transaction } from '../db/datamodel';
using { cappo.cds } from '../db/CDSViews';


service CatalogService @(path:'CatalogService') {

    entity ProductSet as projection on master.product;
    entity BusinessPartnerset as projection on master.businesspartner; 
    entity BusinessAddressSet as projection on master.address;
    entity EmployeeSet as projection on master.employees;
    entity POs as projection on transaction.purchaseorder{
        *,
        Items
    }
    actions{
           action boost() returns POs 
    };
    
    entity POItems as projection on transaction.poitems;
    function largestOrder() returns array of POs;

    //entity OrderItems as projection on cds.CDSViews.ItemView;
    //entity Products as projection on cds.CDSViews.ProductView;
   
}