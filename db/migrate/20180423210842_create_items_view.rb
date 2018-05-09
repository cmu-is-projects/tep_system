class CreateItemsView < ActiveRecord::Migration[5.1]
  def change
    if table_exists? "salesforce.pos_transactions__c" then 
        say_with_time("Creating Items view from Salesforce POS Transactions") do
          execute <<-SQL
            CREATE VIEW items_view AS 
              SELECT  pos.sfid as sfid, 
                      pos.name as pos_trans_id, 
                      (SELECT name FROM salesforce.product_master__c as prod 
                        WHERE prod.sfid = pos.product_master__c), 
                      pos.qty_per_unit__c::INTEGER as qty_per_unit,
                      pos.qty_multiplier__c as qty_multiplier,
                      pos.shopping_limit__c as max_packs, 
                      pos.carton__c as carton,
                      (pos.carton__c = 'a0NW0000002RrvPMAS') as active,
                      pos.sort__c as sort
                FROM salesforce.pos_transactions__c as pos
               WHERE carton__c IS NOT NULL; 
        SQL
    end
    end 
  end
end
