//
//  DinnergyDB .swift
//  Dinnergy
//
//  Created by Simon 易 on 11/06/2019.
//  Copyright © 2019 Edgy Eats. All rights reserved.
//
import UIKit
import SQLite3

var db: OpaquePointer?

class DinnergyDB {
    
     init()  {
        let fileURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("dinnergy.sqlite")
        
        
        if sqlite3_open(fileURL!.path, &db) != SQLITE_OK {
            print("ERROR opening database")
            return
        }else{
            print("SUCCESS opening database")
        }
        
        createTable()
        dropRecipeTable()
        createRecipeTable()
        dropRecipeIngredientTable()
        createRecipeIngredientsTable()
        insertRecipe(name: "Butter bean & chorizo stew", method: "1. Slice the chorizo and tip into a large saucepan over a medium heat. Fry gently for 5 mins or until starting to turn dark brown. Add the tomatoes and butter beans, bring to the boil, then simmer for 10 mins. Swirl through the pesto, season lightly and ladle into four bowls." , attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2016/08/butter-bean-chorizo-stew.jpg?itok=8gg1NtD3")
        
        insertRecipe(name: "Roasted vegetable & feta tostada", method: "1. Heat oven to 200C/180C fan/gas 6. In a roasting tin, season the frozen vegetables and toss with the Mexican seasoning, then roast in the oven for 15 mins, until hot. Meanwhile, mix the avocado, lime juice and tomatoes with some seasoning, then set aside. 2.Put the tortillas on a baking sheet and cook above the vegetables for the final 5 mins of cooking time until crisp. Transfer the crispy tortillas to plates, scatter with rocket and top with the roasted vegetables. Add some of the avocado salsa and sprinkle over the feta", attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe_images/recipe-image-legacy-id--776509_11.jpg?itok=2yNWKRyg")
        
        insertRecipe(name: "Vegan banana bread", method: "1.Heat oven to 200C/180C fan/gas 6. Mash 3 large black peeled bananas with a fork, then mix well with 75g vegetable or sunflower oil and 100g brown sugar. 2. Add 225g plain flour, 3 heaped tsp baking powder and 3 tsp cinnamon or mixed spice, and combine well. Add 50g dried fruit or nuts, if using. 3. Bake in a greased, lined 2lb loaf tin for 20 minutes. Check and cover with foil if the cake is browning. 4. Bake for another 20 minutes, or until a skewer comes out clean. 5. Allow to cool a little before slicing. It's delicious freshly baked, but develops a lovely gooey quality the day after." , attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2017/12/vegan-banana-bread.jpg?itok=UQuKnuov")
        
        insertRecipe(name: "Prawn & leek frittata", method: "1. Heat 2 tbsp olive oil in a medium frying pan. Slice the leeks and add to the pan, cooking for 5 mins. Add the prawns and cook for 1 min more. Beat the eggs and whisk through half the cream cheese. Season to taste. Pour the mixture over the prawns and leeks, dot over the remaining cheese and cook on a medium heat for 5-8 mins. Finish under a medium-hot grill for 2 mins until just set with a slight wobble." , attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2016/10/leek-frittata.jpg?itok=V-h2BoSg")
        
        insertRecipe(name: "Vegetable Pasta", method: "1.Heat the grill and pop the peppers, skin-side up, underneath for 10 mins or until beginning to char. Transfer to a bowl, cover and set aside. When cool enough to handle, peel off the skin and cut the flesh into strips. 2. Heat the oil in a large saucepan and cook the fennel, onion and carrot for 8-10 mins until softened. Stir in the garlic, crushed chillies, fennel seeds and tomato purée, cook for 2 mins, then add the canned tomatoes, stock and sugar. Simmer, uncovered, for 15 mins or until the vegetables are completely soft. 3. Take out a couple of spoonfuls of the sauce (this will later add texture), then blend the rest in the saucepan until almost smooth with a stick blender. Simmer for 5 mins to thicken, then stir in the reserved sauce, shredded basil and peppers. Serve with the pasta." , attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe_images/recipe-image-legacy-id--265467_12.jpg?itok=U8zV5RNL")
        
        insertRecipe(name: "Thai Prawn Curry", method: "1. Heat the oil in a medium saucepan. Tip in the onion and ginger, then cook for a few mins until softened. Stir in the curry paste, then cook for 1 min more. Pour over the chopped tomatoes and coconut cream. Bring to the boil, then leave to simmer for 5 mins, adding a little boiling water if the mixture gets too thick. 2. Tip in the prawns, then cook for 5-10 mins more, depending on how large they are. Serve alongside some plain rice and sprinkle with a little chopped coriander, if you like." , attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe_images/recipe-image-legacy-id--338576_12.jpg?itok=slZMomjp")
        
        insertRecipe(name: "Curried Cod", method: "1.Heat the oil in a large, lidded frying pan. Cook the onion over a high heat for a few mins, then stir in the curry powder, ginger and garlic. Cook for another 1-2 mins until fragrant, then stir in the tomatoes, chickpeas and some seasoning. 2. Cook for 8-10 mins until thickened slightly, then top with the cod. Cover and cook for another 5-10 mins until the fish is cooked through. Scatter over the lemon zest and coriander, then serve with the lemon wedges to squeeze over." , attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2016/08/curried-cod.jpg?itok=7P5xS7qS")
        
        insertRecipe(name: "Courgette risotto", method: "1. Heat the oil in a large pan. Cook the onion and garlic for 5 mins until the onion has softened. Add the tomatoes and cook for 3-4 mins until softened and pulpy, then add the rice and rosemary. 2. Pour in half the stock and leave to cook for 10 mins or until the liquid has evaporated, stirring from time to time. Add the rest of the stock, then continue to cook for a further 5 mins. 3. Stir in the courgettes and peas, then cook for another 5 mins or so, stirring until the rice is tender, but the mixture is still a bit saucy. Can be frozen at this stage for up to 1 month. Season with plenty of black pepper, then add the basil and stir until wilted. Serve immediately.", attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe_images/recipe-image-legacy-id--279531_11.jpg?itok=SX3Obb69")
        
        insertRecipe(name: "Satay sweet potato curry", method: "1. Melt 1 tbsp coconut oil in a saucepan over a medium heat and soften 1 chopped onion for 5 mins. Add 2 grated garlic cloves and a grated thumb-sized piece of ginger, and cook for 1 min until fragrant. 2. Stir in 3 tbsp Thai red curry paste, 1 tbsp smooth peanut butter and 500g sweet potato, peeled and cut into chunks, then add 400ml coconut milk and 200ml water. 3. Bring to the boil, turn down the heat and simmer, uncovered, for 25-30 mins or until the sweet potato is soft. 4. Stir through 200g spinach and the juice of 1 lime, and season well. Serve with cooked rice, and if you want some crunch, sprinkle over a few dry roasted peanuts." , attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2017/07/satay-sweet-potato-curry.jpg?itok=bl5QzsfL")
        
        insertRecipe(name: "Curried cauliflower & lentil soup", method: "1. Remove the outer leaves from the cauliflower, cut off the stalk and roughly chop, then cut the head into small florets. Toss a quarter of the florets in 1 tbsp oil and 1 tsp of the fennel seeds, season well, then tip into a roasting tin and set aside. 2. Heat oven to 220C/200C fan/gas 7. Heat ½ tbsp oil in a saucepan over a medium heat and add the remaining fennel seeds, toast for 2 mins, then add the lentils and the remaining cauliflower. Stir in the curry paste, then add 1 litre water and bring to the boil. Simmer for 25 mins until the cauliflower is tender and the lentils are cooked through. 3. Meanwhile, put the roasting tin of cauliflower in the oven and cook for 20 mins until crisp and slightly charred. Tip the soup mixture into a food processor and blitz until smooth, tip back into the pan to warm through, adding the lemon juice and a little water if it’s too thick. Tip into bowls and top with the crispy cauliflower and fennel seeds to serve.", attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2018/01/curried-cauliflower-lentil-soup.jpg?itok=lzhx3X0S")
        
        insertRecipe(name: "Garlic chicken parcels", method: "1. Heat oven to 220C/200C Fan/gas 7. Cut a slit halfway in each chicken breast, then put each one between two pieces of baking parchment and bash with a rolling pin to flatten slightly. 2. Cut your sheet of pastry in half widthways and put both halves on a baking tray. Sit a chicken breast on top of each half, then cram the cavities with the Boursin (don’t worry if a bit of cheese oozes out). Season, scatter over the lemon zest then fold the edges of the pastry in to the centre and pinch shut. Flip each parcel over so the seal is on the bottom. Brush with a little oil, then bake for 30 mins until deep golden. 3. About 10 mins before your parcels are ready, steam or boil the greens until tender. Toss in the oil and season. Serve alongside your chicken parcels with lemon wedges for squeezing over.", attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2018/01/garlic-chicken-parcels.jpg?itok=JOIicVC1")
        
        insertRecipe(name: "Sausages with pesto mash", method: "1. Peel and quarter the potatoes, then cook in a large pan of salted, boiling water for 15 mins. Drain and set aside. 2. Pour a glug of olive oil into a large frying pan over a medium heat and cook the sausages for 15 mins. Add the tomatoes to the pan for the final 5 mins. Mash the potatoes well and mix in the pesto. Season and serve with the sausages and tomatoes.", attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2016/08/sausage-with-pesto-mash.jpg?itok=jR-OBzrF")
        
        insertRecipeIngredients(recipe_id: 1, item: "2 Cans of chopped tomatoes", quantity: 800, unit: "g")
        
        insertRecipeIngredients(recipe_id: 1, item: "Chorizo", quantity: 200, unit: "g")
        
        insertRecipeIngredients(recipe_id: 1, item: "2 cans of drained butter beans", quantity: 800, unit: "g")
        
        insertRecipeIngredients(recipe_id: 1, item: "Pesto", quantity: 1, unit: "tub")
        
        insertRecipeIngredients(recipe_id: 2, item: "Frozen grilled vegetables", quantity: 325, unit: "g")
        
        insertRecipeIngredients(recipe_id: 2, item: "Mexican seasoning", quantity: 1, unit: "tsp")
        
        insertRecipeIngredients(recipe_id: 2, item: "Avocado", quantity: 1, unit: "small")
        
        insertRecipeIngredients(recipe_id: 2, item: "lime", quantity: 1, unit: "")
        
        insertRecipeIngredients(recipe_id: 2, item: "Cherry tomatoes", quantity: 75, unit: "g")
        
        insertRecipeIngredients(recipe_id: 2, item: "Flour tortillas", quantity: 2, unit: "small")
        
        insertRecipeIngredients(recipe_id: 2, item: "Rocket", quantity: 2, unit: "handfuls")
        
        insertRecipeIngredients(recipe_id: 2, item: "Feta cheese", quantity: 2, unit: "tbsp")
        
        insertRecipeIngredients(recipe_id: 3, item: "Bananas", quantity: 3, unit: "large")
        
        insertRecipeIngredients(recipe_id: 3, item: "Vegetable oil", quantity: 75, unit: "g")
        
        insertRecipeIngredients(recipe_id: 3, item: "Brown sugar", quantity: 100, unit: "g")
        
        insertRecipeIngredients(recipe_id: 3, item: "Plain flour", quantity: 225, unit: "g")
        
        insertRecipeIngredients(recipe_id: 3, item: "Baking powder", quantity: 3, unit: "tsp")
        
        insertRecipeIngredients(recipe_id: 3, item: "Cinnamon", quantity: 3, unit: "tsp")
        
        insertRecipeIngredients(recipe_id: 3, item: "Dried Fruit/nuts", quantity: 50, unit: "g")
        
        insertRecipeIngredients(recipe_id: 4, item: "Leeks", quantity: 3, unit: "large")
        
        insertRecipeIngredients(recipe_id: 4, item: "King prawns", quantity: 150, unit: "g")
        
        insertRecipeIngredients(recipe_id: 4, item: "Garlic and herb cream cheese", quantity: 120, unit: "g")
        
        insertRecipeIngredients(recipe_id: 5, item: "Red pepper", quantity: 2, unit: "medium")
        
        insertRecipeIngredients(recipe_id: 5, item: "Olive oil", quantity: 2, unit: "tbsp")
        
        insertRecipeIngredients(recipe_id: 5, item: "Fennel", quantity: 1, unit: "bulb")
        
        insertRecipeIngredients(recipe_id: 5, item: "Onion", quantity: 1, unit: "medium")
        
        insertRecipeIngredients(recipe_id: 5, item: "Carrot", quantity: 1, unit: "large")
        
        insertRecipeIngredients(recipe_id: 5, item: "Garlic", quantity: 2, unit: "cloves")
        
        insertRecipeIngredients(recipe_id: 5, item: "Chilli flakes", quantity: 1, unit: "tsp")
        
        insertRecipeIngredients(recipe_id: 5, item: "Fennel seeds", quantity: 1, unit: "tsp")
        
        insertRecipeIngredients(recipe_id: 5, item: "Tomato puree", quantity: 2, unit: "tbsp")
        
        insertRecipeIngredients(recipe_id: 5, item: "Can of chopped tomatoes", quantity: 400, unit: "g")
        
        insertRecipeIngredients(recipe_id: 5, item: "Vegetable stock", quantity: 600, unit: "ml")
        
        insertRecipeIngredients(recipe_id: 5, item: "Caster sugar", quantity: 1, unit: "tsp")
        
        insertRecipeIngredients(recipe_id: 5, item: "Basil leaves", quantity: 1, unit: "handful")
        
        insertRecipeIngredients(recipe_id: 5, item: "Egg pasta", quantity: 500, unit: "g")
        
        insertRecipeIngredients(recipe_id: 6, item: "Vegetable oil", quantity: 1, unit: "tbsp")
        
        insertRecipeIngredients(recipe_id: 6, item: "Onion", quantity: 1, unit: "medium")
        
        insertRecipeIngredients(recipe_id: 6, item: "Root ginger", quantity: 1, unit: "tsp")
        
        insertRecipeIngredients(recipe_id: 6, item: "Can of chopped tomatoes", quantity: 400, unit: "g")
        
        insertRecipeIngredients(recipe_id: 6, item: "Thai red curry paste", quantity: 2, unit: "tsp")
        
        insertRecipeIngredients(recipe_id: 6, item: "Coconut cream", quantity: 50, unit: "g")
        
        insertRecipeIngredients(recipe_id: 6, item: "Prawns", quantity: 400, unit: "g")
        
        insertRecipeIngredients(recipe_id: 6, item: "Chopped coriander (optional)", quantity: 1, unit: "handful")
        
        insertRecipeIngredients(recipe_id: 7, item: "Oil", quantity: 1, unit: "tbsp")
        
        insertRecipeIngredients(recipe_id: 7, item: "Onion", quantity: 1, unit: "")
        
        insertRecipeIngredients(recipe_id: 7, item: "Curry powder", quantity: 2, unit: "tbsp")
        
        insertRecipeIngredients(recipe_id: 7, item: "Ginger", quantity: 1, unit: "thumb-size")
        
        insertRecipeIngredients(recipe_id: 7, item: "Garlic cloves", quantity: 3, unit: "")
        
        insertRecipeIngredients(recipe_id: 7, item: "Canned chopped tomatoes", quantity: 800, unit: "g")
        
        insertRecipeIngredients(recipe_id: 7, item: "Canned chickpeas", quantity: 400, unit: "g")
        
        insertRecipeIngredients(recipe_id: 7, item: "Cod fillets", quantity: 4, unit: "")
        
        insertRecipeIngredients(recipe_id: 7, item: "Lemon zest", quantity: 1, unit: "")
        
        insertRecipeIngredients(recipe_id: 7, item: "Coriander", quantity: 1, unit: "handful")
        
        insertRecipeIngredients(recipe_id: 8, item: "Olive oil", quantity: 1, unit: "tbsp")
        
        insertRecipeIngredients(recipe_id: 8, item: "Onion", quantity: 1, unit: "")
        
        insertRecipeIngredients(recipe_id: 8, item: "Garlic cloves", quantity: 2, unit: "")
        
        insertRecipeIngredients(recipe_id: 8, item: "Chopped ripe tomatoes", quantity: 3, unit: "")
        
        insertRecipeIngredients(recipe_id: 8, item: "Risotto rice", quantity: 350, unit: "g")
        
        insertRecipeIngredients(recipe_id: 8, item: "Chopped rosemary", quantity: 1, unit: "tsp")
        
        insertRecipeIngredients(recipe_id: 8, item: "Hot vegetable stock", quantity: 1.5, unit: "")
        
        insertRecipeIngredients(recipe_id: 8, item: "Courgettes", quantity: 3, unit: "")
        
        insertRecipeIngredients(recipe_id: 8, item: "Peas", quantity: 140, unit: "g")
        
        insertRecipeIngredients(recipe_id: 8, item: "Basil", quantity: 1, unit: "handful")
        
        insertRecipeIngredients(recipe_id: 9, item: "Coconut oil", quantity: 1, unit: "tbsp")
        
        insertRecipeIngredients(recipe_id: 9, item: "Onion", quantity: 1, unit: "")
        
        insertRecipeIngredients(recipe_id: 9, item: "Garlic cloves", quantity: 2, unit: "")
        
        insertRecipeIngredients(recipe_id: 9, item: "Ginger", quantity: 1, unit: "thumb-size")
        
        insertRecipeIngredients(recipe_id: 9, item: "Thai red curry paste", quantity: 3, unit: "tbsp")
        
        insertRecipeIngredients(recipe_id: 9, item: "Smooth peanut butter", quantity: 1, unit: "tbsp")
        
        insertRecipeIngredients(recipe_id: 9, item: "Sweet potato", quantity: 500, unit: "g")
        
        insertRecipeIngredients(recipe_id: 9, item: "Canned coconut milk", quantity: 400, unit: "ml")
        
        insertRecipeIngredients(recipe_id: 9, item: "Spinach", quantity: 200, unit: "g")
        
        insertRecipeIngredients(recipe_id: 9, item: "Juiced lime", quantity: 1, unit: "")
        
        insertRecipeIngredients(recipe_id: 10, item: "Cauliflower", quantity: 1, unit: "")
        
        insertRecipeIngredients(recipe_id: 10, item: "Oil", quantity: 1.5, unit: "tbsp")
        
        insertRecipeIngredients(recipe_id: 10, item: "Fennel seeds", quantity: 2, unit: "tsp")
        
        insertRecipeIngredients(recipe_id: 10, item: "Red lentils", quantity: 150, unit: "g")
        
        insertRecipeIngredients(recipe_id: 10, item: "Curry paste", quantity: 3, unit: "tbsp")
        
        insertRecipeIngredients(recipe_id: 10, item: "Juiced lemon", quantity: 0.5, unit: "")
        
        insertRecipeIngredients(recipe_id: 11, item: "Chicken breasts", quantity: 2, unit: "")
        
        insertRecipeIngredients(recipe_id: 11, item: "All butter puff pastry", quantity: 320, unit: "g")
        
        insertRecipeIngredients(recipe_id: 11, item: "Garlic and herb cream cheese", quantity: 150, unit: "g")
        
        insertRecipeIngredients(recipe_id: 11, item: "Lemon zest", quantity: 0.5, unit: "")
        
        insertRecipeIngredients(recipe_id: 11, item: "Olive oil", quantity: 1, unit: "tbsp")
        
        insertRecipeIngredients(recipe_id: 11, item: "Mixed pack green beans and broccoli", quantity: 200, unit: "g")
        
        insertRecipeIngredients(recipe_id: 12, item: "White potatoes", quantity: 3, unit: "")
        
        insertRecipeIngredients(recipe_id: 12, item: "Pork sausages", quantity: 4, unit: "")
        
        insertRecipeIngredients(recipe_id: 12, item: "Olive oil (for frying)", quantity: 4, unit: "tbsp")
        
        insertRecipeIngredients(recipe_id: 12, item: "Cherry tomatoes", quantity: 200, unit: "g")
        
        insertRecipeIngredients(recipe_id: 12, item: "Fresh pesto", quantity: 0.5, unit: "tub")
        
        
    }
    
    func createTable() {
        let createTableQuery = "CREATE TABLE IF NOT EXISTS Ingredients (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, quantity DOUBLE, unit TEXT)"

        if sqlite3_exec(db,createTableQuery, nil, nil, nil) != SQLITE_OK{
            print("Error Creating Table")
            return
        }
        print("Table Created")

        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print("App Path: \(dirPaths)")
        
    }
    
    func createRecipeTable(){
        let createTableQuery = "CREATE TABLE IF NOT EXISTS Recipes (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, method TEXT , attachment TEXT)"
        
        if sqlite3_exec(db,createTableQuery, nil, nil, nil) != SQLITE_OK{
            print("Error Creating Table")
            return
        }
        print("Table Created")
        
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print("App Path: \(dirPaths)")
        
    }
    
    func dropRecipeTable(){
        let dropQuery = "DROP TABLE Recipes"
        
        if sqlite3_exec(db,dropQuery, nil, nil, nil) != SQLITE_OK{
            print("Error Creating Table")
            return
        }
        print("Table Created")
        
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print("App Path: \(dirPaths)")
        
    }
    
    func dropRecipeIngredientTable(){
        let dropQuery = "DROP TABLE Recipe_Ingredients"
        
        if sqlite3_exec(db,dropQuery, nil, nil, nil) != SQLITE_OK{
            print("Error Creating Table")
            return
        }
        print("Table Created")
        
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print("App Path: \(dirPaths)")
        
    }

    
    func createRecipeIngredientsTable(){
        let createTableQuery = "CREATE TABLE IF NOT EXISTS Recipe_Ingredients (id INTEGER PRIMARY KEY AUTOINCREMENT, recipe_id REFERENCES Recipes(id), item TEXT, quantity DOUBLE , unit TEXT)"
        
        if sqlite3_exec(db,createTableQuery, nil, nil, nil) != SQLITE_OK{
            print("Error Creating Table")
            return
        }
        print("Table Created")
        
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print("App Path: \(dirPaths)")
        
    }
    
    func insertIngredients(name: String, quantity: Double, unit: String) {
        
        var stmt: OpaquePointer?
        let SQLITETRANSIENT = unsafeBitCast(OpaquePointer(bitPattern: -1), to: sqlite3_destructor_type.self)
        
        let queryString = "INSERT INTO Ingredients (name, quantity, unit) VALUES (?,?,?)"
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 1, name, -1, SQLITETRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
            return
        }
        
        if sqlite3_bind_double(stmt, 2, quantity ) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding quantity: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 3, unit, -1, SQLITETRANSIENT ) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding unit \(errmsg)")
            return
        }
        
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting hero: \(errmsg)")
            return
        }
        
        print("Ingredients saved successfully")
    }
    
    func insertRecipe(name: String, method: String, attachment: String) {
        
        var stmt: OpaquePointer?
        let SQLITETRANSIENT = unsafeBitCast(OpaquePointer(bitPattern: -1), to: sqlite3_destructor_type.self)
        
        let queryString = "INSERT INTO Recipes (name, method, attachment) VALUES (?,?,?)"
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 1, name, -1, SQLITETRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 2, method, -1, SQLITETRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding quantity: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 3, attachment, -1, SQLITETRANSIENT ) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding unit \(errmsg)")
            return
        }
        
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting hero: \(errmsg)")
            return
        }
        
        print("Recipe saved successfully")
    }
    
    func insertRecipeIngredients(recipe_id: Int32, item: String, quantity: Double, unit: String) {
        
        var stmt: OpaquePointer?
        let SQLITETRANSIENT = unsafeBitCast(OpaquePointer(bitPattern: -1), to: sqlite3_destructor_type.self)
        
        let queryString = "INSERT INTO Recipe_Ingredients (recipe_id, item, quantity, unit) VALUES (?,?,?,?)"
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        if sqlite3_bind_int(stmt, 1, recipe_id ) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding quantity: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 2, item, -1, SQLITETRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
            return
        }
        
        if sqlite3_bind_double(stmt, 3, quantity ) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding quantity: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 4, unit, -1, SQLITETRANSIENT ) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding unit \(errmsg)")
            return
        }
        
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting hero: \(errmsg)")
            return
        }
        
        print("Recipe Ingredients saved successfully")
    }
    
    func checkStock(){
        var stock = [Ingredient]()
        stock.removeAll()
        
        let queryString = "SELECT * FROM Ingredients"
        var stmt:OpaquePointer?
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        //traversing through all the records
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let id = sqlite3_column_int(stmt, 0)
            let name = String(cString: sqlite3_column_text(stmt, 1))
            let quantity = sqlite3_column_double(stmt, 2)
            let unit = sqlite3_column_text(stmt, 3)
            
            //adding values to list
            stock.append(Ingredient(id: Int(id), name: name, quantity: Double(quantity), unit: String(cString: unit!)))
        }
        dump(stock)
    }
    
    
    func updateStock(name: String, quantity: Double){
        
        let updateStatementString = "UPDATE Ingredients SET Quantity = " + String(quantity) + " WHERE Name = '" + name + "';"
        
        var updateStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
            if sqlite3_step(updateStatement) == SQLITE_DONE {
                print("Successfully updated row.")
            } else {
                print("Could not update row.")
            }
        } else {
            print("UPDATE statement could not be prepared")
        }
        sqlite3_finalize(updateStatement)
    }
    
    func deleteItem(name: String) {
        let deleteStatementStirng = "DELETE FROM Ingredients WHERE Name = '" + name + "';"
        var deleteStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, deleteStatementStirng, -1, &deleteStatement, nil) == SQLITE_OK {
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Successfully deleted row.")
            } else {
                print("Could not delete row.")
            }
        } else {
            print("DELETE statement could not be prepared")
        }
        
        sqlite3_finalize(deleteStatement)
    }

}

