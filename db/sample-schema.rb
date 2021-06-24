#spree comerse schema sample
 
#table for products
create_table "products", force: :cascade do |t|
    t.string   "name",
    t.string   "sku", 
    t.string   "price",
    t.datetime "available_on",
    t.integer  "varient_id"
    t.string   "shipping_category_id"
    t.string   "tax_category_id"
end

#table for products varients 
create_table "varients", force: :cascade do |t|
    t.string   "sku",                               
    t.decimal  "price",         
    t.decimal  "weight",    
    t.decimal  "height",        
    t.decimal  "width",        
    t.decimal  "depth",         
    t.datetime "deleted_at"                             
    t.integer  "product_id"                   
    t.decimal  "cost_price",    
end


# table for store
create_table "stores", force : :cascade do |t| 
    t.string   "name",
    t.string   "url",
    t.string   "seo_title",
    t.string   "meta_description",
    t.string   "email",
    t.integer  "social_id",
    t.string   "currency",
    t.datetime "created_at",                           
    t.datetime "updated_at", 
end

#Social links for store
create_table "social_links" force : :cascade do |t| 
    t.string   "facebook",
    t.string   "twiter",
    t.string   "instagram",
    t.datetime "created_at",                           
    t.datetime "updated_at", 
end


create_table "orders", :force => true do |t|
    t.decimal  "item_total",                         
    t.decimal  "total",  
    t.decimal "tax_rate_id"                          
    t.string   "state"                                       
    t.integer  "user_id"
    t.datetime "created_at",                                                                       
    t.datetime "updated_at",                                                                       
    t.datetime "completed_at"
    t.integer  "address_id"
    t.integer  "address_id"
    t.decimal  "payment_total",                     
    t.integer  "shipping_method_id"
    t.string   "email"
  end
 

#table for shipment
create_table "shipments", force: :cascade do |t| #all the shipping details of the product 
    t.string   "city"
    t.string   "zipcode"
    t.integer  "alternative_phone",
    t.integer  "phone", 
    t.datetime "shipped_at",
    t.integer  "Tracking_id",
    t.string   "shipping_method",
    t.string "shipping_address"
    t.integer  "cost",
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
end  

#table for shipping_methods
create_table "shipping_methods", force: :cascade do |t| 
    t.string   "name"
    t.integer "shipment_category_id" 
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
end

#table for shipment category
create_table "shipment_categories", force: :cascade do |t| #table contain shipping categories
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
end


# table for shipping address
create_table "addresses", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address1"
    t.string   "city"
    t.string   "zipcode"
    t.string   "phone"
    t.string   "state_name"
    t.string   "alternative_phone"
    t.integer  "state_id"
    t.integer  "country_id"
    t.datetime "created_at",      
    t.datetime "updated_at",        
    t.string   "company"
end

# table for Countries name
create_table "countries", force : :cascade do |t|
    t.name "name"
    t.integer "country_code"
    t.datetime "created_at", 
    t.datetime "updated_at", 
end

# table for state name
create_table "states", force : :cascade do |it|
    t.name "name"
    t.integer "country_id"
    t.datetime "created_at", 
    t.datetime "updated_at", 
end

#table for users
create_table "users", force : :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
end


#table for applying promotion or promo code
create_table "promotions",  force : :cascade do |t| 
  	t.integer  "Promotion_Id",
  	t.string    "Category",
  	t.datetime  "created_at",
  	t.datetime  "deleted_at",
  	t.string    "varient_id",
end

#promotion rule
create_table "promotion_rule", force : :cascade do |t|
    t.string ""
end

#table for tax category
create_table "tax_categories" force : :cascade do |t| 
    t.string   "name",
    t.string   "description",
    t.string   "string",
    t.datetime "created_at",                  
    t.datetime "updated_at",
end

# table for tax Rate
create_table "tax_rates" force : :cascade do |t| 
    t.string  "name",
    t.decimal  "amount",
    t.integer  "zone_id",
    t.integer  "tax_category_id",
    t.datetime "created_at",                           
    t.datetime "updated_at", 
end

# table for tax acording to zones
create_table "tax_zones", force : :cascade do |t| 
    t.string   "name",
    t.string   "description",
    t.datetime "created_at",                           
    t.datetime "updated_at", 
end
