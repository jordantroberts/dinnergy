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
         createListsTable()
       
    insertRecipe(name: "Butter Bean & Chorizo Stew", ingredients: "2 Cans of chopped tomatoes\n\n200g Chorizo\n\n2x400g cans of drained butter beans\n\n1 tub Pesto", method: "1. Slice the chorizo and tip into a large saucepan over a medium heat.\n\n2. Fry gently for 5 mins or until starting to turn dark brown.\n\n3. Add the tomatoes and butter beans, bring to the boil, then simmer for 10 mins.\n\n4. Swirl through the pesto, season lightly and ladle into four bowls.", attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2016/08/butter-bean-chorizo-stew.jpg?itok=8gg1NtD3")
        
    insertRecipe(name: "Roasted Vegetable & Feta Tostada", ingredients: "325g Frozen grilled vegetables\n\n1 tsp Mexican seasoning\n\n1 Small Avocado\n\n1 Lime\n\n75g Cherry tomatoes\n\n2 Small Flour tortillas\n\n2 Handfuls Rocket\n\n2 tbsp Feta cheese", method: "1. Heat oven to 200C/180C fan/gas mark 6. In a roasting tin, season the frozen vegetables and toss with the Mexican seasoning, then roast in the oven for 15 mins, until hot. Meanwhile, mix the avocado, lime juice and tomatoes with some seasoning, then set aside.\n\n2. Put the tortillas on a baking sheet and cook above the vegetables for the final 5 mins of cooking time until crisp.\n\n3. Transfer the crispy tortillas to plates, scatter with rocket and top with the roasted vegetables. Add some of the avocado salsa and sprinkle over the feta", attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe_images/recipe-image-legacy-id--776509_11.jpg?itok=2yNWKRyg")
        
    insertRecipe(name: "Vegan Banana Bread", ingredients: "3 Large Bananas\n\n75g Vegetable oil\n\n100g Brown sugar\n\n225g Plain flour\n\n3 tsp Baking powder\n\n3 tsp Cinnamon\n\n50g Dried fruit/nuts", method: "1. Heat oven to 200C/180C fan/gas mark 6. Mash 3 large black peeled bananas with a fork, then mix well with 75g vegetable or sunflower oil and 100g brown sugar.\n\n2. Add 225g plain flour, 3 heaped tsp baking powder and 3 tsp cinnamon or mixed spice, and combine well. Add 50g dried fruit or nuts, if using.\n\n3. Bake in a greased, lined 2lb loaf tin for 20 minutes. Check and cover with foil if the cake is browning.\n\n4. Bake for another 20 minutes, or until a skewer comes out clean.\n\n5. Allow to cool a little before slicing. It's delicious freshly baked, but develops a lovely gooey quality the day after." , attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2017/12/vegan-banana-bread.jpg?itok=UQuKnuov")
        
    insertRecipe(name: "Prawn & Leek Frittata", ingredients: "3 Large Leeks\n\n150g King Prawns\n\n120g Garlic and Herb Cream cheese", method: "1. Heat 2 tbsp olive oil in a medium frying pan. Slice the leeks and add to the pan, cooking for 5 mins.\n\n2. Add the prawns and cook for 1 min more.\n\n3. Beat the eggs and whisk through half the cream cheese. Season to taste.\n\n4. Pour the mixture over the prawns and leeks, dot over the remaining cheese and cook on a medium heat for 5-8 mins.\n\n5. Finish under a medium-hot grill for 2 mins until just set with a slight wobble." , attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2016/10/leek-frittata.jpg?itok=V-h2BoSg")
        
    insertRecipe(name: "Vegetable Pasta", ingredients: "2 Medium Red pepper\n\n2 tbsp Olive oil\n\n1 Bowl Fennel\n\n1 Medium Onion\n\n1 Large Carrot\n\n2 Cloves Garlic\n\n1 tsp Chilli flakes\n\n1 tsp Fennel seeds\n\n2 tbsp Tomato purree\n\n400g Can of chopped tomatoes\n\n600ml Vegetable stock\n\n1 tsp Caster sugar\n\n1 Handful Basil leaves\n\n500g Egg pasta", method: "1. Heat the grill and pop the peppers, skin-side up, underneath for 10 mins or until beginning to char. Transfer to a bowl, cover and set aside. When cool enough to handle, peel off the skin and cut the flesh into strips.\n\n2. Heat the oil in a large saucepan and cook the fennel, onion and carrot for 8-10 mins until softened. Stir in the garlic, crushed chillies, fennel seeds and tomato purée, cook for 2 mins, then add the canned tomatoes, stock and sugar. Simmer, uncovered, for 15 mins or until the vegetables are completely soft.\n\n3. Take out a couple of spoonfuls of the sauce (this will later add texture), then blend the rest in the saucepan until almost smooth with a stick blender. Simmer for 5 mins to thicken, then stir in the reserved sauce, shredded basil and peppers. Serve with the pasta." , attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe_images/recipe-image-legacy-id--265467_12.jpg?itok=U8zV5RNL")
        
    insertRecipe(name: "Thai Prawn Curry", ingredients: "1 tbsp Vegetable oil\n\n1 Medium Onion\n\n1 tsp Root ginger\n\n400g Can of chopped tomatoes\n\n2 tsp Thai red curry paste\n\n50g Coconut cream\n\n400g Prawns\n\n1 Handful Chopped coriander (optional)", method: "1. Heat the oil in a medium saucepan. Tip in the onion and ginger, then cook for a few mins until softened.\n\n2. Stir in the curry paste, then cook for 1 min more.\n\n3. Pour over the chopped tomatoes and coconut cream.\n\n4. Bring to the boil, then leave to simmer for 5 mins, adding a little boiling water if the mixture gets too thick.\n\n5. Tip in the prawns, then cook for 5-10 mins more, depending on how large they are.\n\n6. Serve alongside some plain rice and sprinkle with a little chopped coriander, if you like." , attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe_images/recipe-image-legacy-id--338576_12.jpg?itok=slZMomjp")
        
    insertRecipe(name: "Curried Cod", ingredients: "1 tbsp Oil\n\n1 Onion\n\n2 tbsp Curry powder\n\n1 Thumb-size Ginger\n\n3 Cloves Garlic \n\n2x400g Can chopped tomatoes\n\n400g Can chickpeas\n\n4 Cod fillets\n\nLemon zest\n\n1 Handful Coriander", method: "1. Heat the oil in a large, lidded frying pan. Cook the onion over a high heat for a few mins, then stir in the curry powder, ginger and garlic. Cook for another 1-2 mins until fragrant, then stir in the tomatoes, chickpeas and some seasoning.\n\n2. Cook for 8-10 mins until thickened slightly, then top with the cod. Cover and cook for another 5-10 mins until the fish is cooked through.\n\n3. Scatter over the lemon zest and coriander, then serve with the lemon wedges to squeeze over.", attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2016/08/curried-cod.jpg?itok=7P5xS7qS")
        
    insertRecipe(name: "Courgette Risotto", ingredients: "1 tbsp Olive oil\n\n1 Onion\n\n2 Cloves Garlic\n\n2 Chopped ripe tomatoes\n\n350g Risotto rice\n\n1 tsp Chopped rosemary\n\n1.5 litres Hot vegetable stock\n\n3 Courgettes\n\n140g Peas\n\n1 Handful Basil", method: "1. Heat the oil in a large pan. Cook the onion and garlic for 5 mins until the onion has softened. Add the tomatoes and cook for 3-4 mins until softened and pulpy, then add the rice and rosemary.\n\n2. Pour in half the stock and leave to cook for 10 mins or until the liquid has evaporated, stirring from time to time. Add the rest of the stock, then continue to cook for a further 5 mins.\n\n3. Stir in the courgettes and peas, then cook for another 5 mins or so, stirring until the rice is tender, but the mixture is still a bit saucy. Can be frozen at this stage for up to 1 month.\n\n4. Season with plenty of black pepper, then add the basil and stir until wilted. Serve immediately.", attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe_images/recipe-image-legacy-id--279531_11.jpg?itok=SX3Obb69")
        
    insertRecipe(name: "Satay Sweet Potato Curry", ingredients: "1 tbsp Coconut oil\n\n1 Onion\n\n2 Cloves Garlic\n\n1 Thumb-size Ginger\n\n3 tbsp Thai red curry paste\n\n1 tbsp Smooth peanut butter\n\n500g Sweet potatoes\n\n400ml Canned coconut milk\n\nJuice of 1 Lime\n\n200g Spinach", method: "1. Melt 1 tbsp coconut oil in a saucepan over a medium heat and soften 1 chopped onion for 5 mins. Add 2 grated garlic cloves and a grated thumb-sized piece of ginger, and cook for 1 min until fragrant.\n\n2. Stir in 3 tbsp Thai red curry paste, 1 tbsp smooth peanut butter and 500g sweet potato, peeled and cut into chunks, then add 400ml coconut milk and 200ml water.\n\n3. Bring to the boil, turn down the heat and simmer, uncovered, for 25-30 mins or until the sweet potato is soft.\n\n4. Stir through 200g spinach and the juice of 1 lime, and season well.\n\n5. Serve with cooked rice, and if you want some crunch, sprinkle over a few dry roasted peanuts." , attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2017/07/satay-sweet-potato-curry.jpg?itok=bl5QzsfL")
        
    insertRecipe(name: "Curried Cauliflower & Lentil Soup", ingredients: "1 Cauliflower\n\n1.5 tbsp Oil\n\n2 tsp Fennel seeds\n\n150g Red lentils\n\n3 tbsp Curry paste\n\nJuice of half a Lemon", method: "1. Remove the outer leaves from the cauliflower, cut off the stalk and roughly chop, then cut the head into small florets. Toss a quarter of the florets in 1 tbsp oil and 1 tsp of the fennel seeds, season well, then tip into a roasting tin and set aside. \n\n2. Heat oven to 220C/200C fan/gas mark 7. Heat ½ tbsp oil in a saucepan over a medium heat and add the remaining fennel seeds, toast for 2 mins, then add the lentils and the remaining cauliflower. Stir in the curry paste, then add 1 litre water and bring to the boil. Simmer for 25 mins until the cauliflower is tender and the lentils are cooked through. \n\n3. Meanwhile, put the roasting tin of cauliflower in the oven and cook for 20 mins until crisp and slightly charred. Tip the soup mixture into a food processor and blitz until smooth, tip back into the pan to warm through, adding the lemon juice and a little water if it’s too thick.\n\n4. Tip into bowls and top with the crispy cauliflower and fennel seeds to serve.", attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2018/01/curried-cauliflower-lentil-soup.jpg?itok=lzhx3X0S")
        
    insertRecipe(name: "Garlic Chicken Parcels", ingredients: "2 Chicken breasts\n\n320g All butter puff pastry\n\n150g Garlic and herb cream cheese\n\n1 tbsp Olive oil\n\nLemon zest\n\n200g Mixed pack green beans and broccoli", method: "1. Heat oven to 220C/200C Fan/gas mark 7. Cut a slit halfway in each chicken breast, then put each one between two pieces of baking parchment and bash with a rolling pin to flatten slightly.\n\n2. Cut your sheet of pastry in half widthways and put both halves on a baking tray. Sit a chicken breast on top of each half, then cram the cavities with the Boursin (don’t worry if a bit of cheese oozes out). Season, scatter over the lemon zest then fold the edges of the pastry in to the centre and pinch shut. Flip each parcel over so the seal is on the bottom. Brush with a little oil, then bake for 30 mins until deep golden.\n\n3. About 10 mins before your parcels are ready, steam or boil the greens until tender. Toss in the oil and season. Serve alongside your chicken parcels with lemon wedges for squeezing over.", attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2018/01/garlic-chicken-parcels.jpg?itok=JOIicVC1")
        
    insertRecipe(name: "Sausages with Pesto Mash", ingredients: "3 White potatoes\n\n4 Pork sausages\n\n4tbsp Olive oil (for frying)\n\nHalf Tub Fresh pesto\n\n200g Cherry tomatoes", method: "1. Peel and quarter the potatoes, then cook in a large pan of salted, boiling water for 15 mins. Drain and set aside.\n\n2. Pour a glug of olive oil into a large frying pan over a medium heat and cook the sausages for 15 mins.\n\n3. Add the tomatoes to the pan for the final 5 mins.\n\n4. Mash the potatoes well and mix in the pesto.\n\n5. Season and serve with the sausages and tomatoes.", attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2016/08/sausage-with-pesto-mash.jpg?itok=jR-OBzrF")
        
    insertRecipe(name: "Smoked Mackerel & Leek Hash with Horseradish", ingredients: "250g New potatoes, halved\n\n2 tbsp Oil\n\n2 large leeks, thinly sliced\n\n4 Eggs\n\n100g Peppered smoked mackerel, skin removed\n\n2 tbsp Creamed horseradish", method: "1. Put the potatoes in a microwaveable bowl with a splash of water, cover, then cook on high for 5 mins until tender (or steam or simmer them).\n\n2. Meanwhile, heat the oil in a frying pan over a medium heat, add the leeks with a pinch of salt and cook for 10 mins, stirring so they don’t stick, until softened. Tip in the potatoes, turn up the heat and fry for a couple of mins to crisp them up a bit. Flake through the mackerel.\n\n3. Make four indents in the leek mixture in the pan, crack an egg into each, season, then cover the pan and cook for 6-8 mins until the whites have set and the yolks are runny. Serve the horseradish on the side, with the pan in the middle of the table.", attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2018/01/smoked-mackerel-leek-hash-with-horseradish.jpg?itok=Qq1ccN-G")
        
        insertRecipe(name: "Cheese & Chilli Melts", ingredients: "250g Grated strong cheddar\n\n4 Chopped tomatoes\n\n1 Chopped green chilli\n\nHalf bunch corriander chopped\n\n8 Flour tortillas\n\nOil for brushing", method: "1. Put the cheese, tomatoes, chilli and coriander leaves into a bowl with some seasoning, then mix well.\n\n2. Warm tortillas in the microwave according to pack instructions – this makes them more bendable. Divide the cheese mix over one half of each tortilla. Fold over the other half to make 8 half-moons, then press down to seal.\n\n3. Brush the tops with a little oil, then sit, oil-side down, on a hot area of the barbecue. Cook for a couple of mins until crisp and golden, brush the uncooked side with oil, then flip over for another few mins. Slice into wedges, then pile onto a platter while you cook the rest.", attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe_images/recipe-image-legacy-id--424759_11.jpg?itok=-7hj40CM")
            
    insertRecipe(name: "Vegetarian Chilli", ingredients: "400g pack oven-roasted vegetables\n\n1 can kidney beans in chilli sauce\n\n1 can chopped tomatoes\n\n1 ready-to-eat mixed rice pouch", method: "1. Heat oven to 200C/180C fan/ gas mark 6. Cook the vegetables in a casserole dish for 15 mins. Tip in the beans and tomatoes, season, and cook for another 10-15 mins until piping hot. Heat the pouch in the microwave on High for 1 min and serve with the chilli." , attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2016/06/veggie-chilli.jpg?itok=qvb6j2i4")
            
    insertRecipe(name: "Salmon & Spinach Pasta", ingredients: "200g penne\n\n2 skinless salmon fillets\n\n60g sundried tomatoes\n\n80g bag spinach", method: "1. Cook the pasta following pack instructions. Fry the salmon for 4-6 mins with the tomatoes in their oil. Flake the fish in the pan, then add the drained pasta and the spinach. Stir for 1-2 mins until the spinach is wilted and everything is coated." , attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2016/06/salmon-spinach-pasta.jpg?itok=LHgLpnOY")
            
    insertRecipe(name: "Pad Thai", ingredients: "200g Raw prawns\n\nSmall pack coriander\n\n400g Pad thai noodles\n\n85g Beansprouts\n\n1 Egg\n\n1 Juiced lime\n\n1 tbsp Fish sauce\n\n2 tsp Sugar\n\n1 tbsp Roasted peanuts", method: "1. Dry-fry the prawns and coriander stalks in a non-stick frying pan for 1-2 mins until the prawns are just pink. Add the noodles, beansprouts, egg, lime juice, fish sauce and sugar. Quickly toss together for 1 min more until the egg is just cooked and everything is well mixed – you might want to use a pair of tongs to make this easier.\n\n2. Remove from the heat, mix in most of the coriander leaves, then divide between 2 bowls. Scatter with the remaining coriander and the peanuts, and serve with lime wedges for squeezing over." , attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe_images/recipe-image-legacy-id--24245_10.jpg?itok=4SHpMSF4")
            
    insertRecipe(name: "Asparagus Cream Pasta", ingredients: "1 bunch asparagus\n\n142ml tub double cream\n\n2 garlic cloves, peeled, but left whole\n\n50g parmesan, half grated, half shaved\n\n250g tagliatelle", method: "1. To prepare the asparagus, cut off and discard the woody ends, then neatly cut the tips away from the stalks. Keep the tips and stalks separate. In a small saucepan bring the cream and garlic to the boil. Take off the heat, remove the garlic, then set the pan aside.\n\n2. Cook the stalks in boiling salted water for about 4-5 mins until tender, drain, then tip into the cream with the grated parmesan. Blitz with a hand blender until smooth.\n\n3. Cook the pasta according to pack instructions, then throw in the tips 2 mins before the end of cooking time. Gently reheat the cream, drain pasta, then tip into a bowl with the cream. Toss, divide into pasta bowls, top with parmesan shavings and serve." , attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe_images/recipe-image-legacy-id--1259798_8.jpg?itok=QCf1yTLA")
            
    insertRecipe(name: "Mozzarella & Salami Ciabatta", ingredients: "1 Small ciabatta\n\n1 Small fennel bulb\n\n1 tbsp Olive oil\n\nHandful rocket\n\n63g Mozzarella\n\n8 Slices salami\n\nLemon wedges", method: "1. Cut the bread into 4 pieces and toast. Toss the fennel with 2 tsp olive oil, rocket and seasoning. Rub the remaining oil on the cut sides of the bread, then rub with garlic. Tear over the mozzarella and salami, pile on the salad and serve with some lemon wedges for squeezing over." , attachment: "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe_images/recipe-image-legacy-id--350481_12.jpg?itok=DXDQead0")
        
        insertRecipeIngredients(recipe_id: 1, item: "2 Cans of chopped tomatoes", quantity: 800, unit: "g")
        insertRecipeIngredients(recipe_id: 1, item: "Chorizo", quantity: 200, unit: "g")
        insertRecipeIngredients(recipe_id: 1, item: "2 cans of drained butter beans", quantity: 800, unit: "g")
        insertRecipeIngredients(recipe_id: 1, item: "Pesto", quantity: 1, unit: "tub")
        insertRecipeIngredients(recipe_id: 2, item: "Frozen grilled vegetables", quantity: 325, unit: "g")
        insertRecipeIngredients(recipe_id: 2, item: "Mexican seasoning", quantity: 1, unit: "tsp")
        insertRecipeIngredients(recipe_id: 2, item: "Avocado", quantity: 1, unit: "small")
        insertRecipeIngredients(recipe_id: 2, item: "Lime", quantity: 1, unit: "")
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
        insertRecipeIngredients(recipe_id: 3, item: "Dried fruit/nuts", quantity: 50, unit: "g")
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
        insertRecipeIngredients(recipe_id: 7, item: "Garlic", quantity: 3, unit: "cloves")
        insertRecipeIngredients(recipe_id: 7, item: "Can of chopped tomatoes", quantity: 800, unit: "g")
        insertRecipeIngredients(recipe_id: 7, item: "Can of chickpeas", quantity: 400, unit: "g")
        insertRecipeIngredients(recipe_id: 7, item: "Cod fillets", quantity: 4, unit: "")
        insertRecipeIngredients(recipe_id: 7, item: "Lemon zest", quantity: 1, unit: "")
        insertRecipeIngredients(recipe_id: 7, item: "Coriander", quantity: 1, unit: "handful")
        insertRecipeIngredients(recipe_id: 8, item: "Olive oil", quantity: 1, unit: "tbsp")
        insertRecipeIngredients(recipe_id: 8, item: "Onion", quantity: 1, unit: "")
        insertRecipeIngredients(recipe_id: 8, item: "Garlic", quantity: 2, unit: "cloves")
        insertRecipeIngredients(recipe_id: 8, item: "Chopped ripe tomatoes", quantity: 3, unit: "")
        insertRecipeIngredients(recipe_id: 8, item: "Risotto rice", quantity: 350, unit: "g")
        insertRecipeIngredients(recipe_id: 8, item: "Chopped rosemary", quantity: 1, unit: "tsp")
        insertRecipeIngredients(recipe_id: 8, item: "Hot vegetable stock", quantity: 1.5, unit: "litres")
        insertRecipeIngredients(recipe_id: 8, item: "Courgettes", quantity: 3, unit: "")
        insertRecipeIngredients(recipe_id: 8, item: "Peas", quantity: 140, unit: "g")
        insertRecipeIngredients(recipe_id: 8, item: "Basil", quantity: 1, unit: "handful")
        insertRecipeIngredients(recipe_id: 9, item: "Coconut oil", quantity: 1, unit: "tbsp")
        insertRecipeIngredients(recipe_id: 9, item: "Onion", quantity: 1, unit: "")
        insertRecipeIngredients(recipe_id: 9, item: "Garlic", quantity: 2, unit: "cloves")
        insertRecipeIngredients(recipe_id: 9, item: "Ginger", quantity: 1, unit: "thumb-size")
        insertRecipeIngredients(recipe_id: 9, item: "Thai red curry paste", quantity: 3, unit: "tbsp")
        insertRecipeIngredients(recipe_id: 9, item: "Smooth peanut butter", quantity: 1, unit: "tbsp")
        insertRecipeIngredients(recipe_id: 9, item: "Sweet potato", quantity: 500, unit: "g")
        insertRecipeIngredients(recipe_id: 9, item: "Can of coconut milk", quantity: 400, unit: "ml")
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
        insertRecipeIngredients(recipe_id: 13, item: "New potatoes", quantity: 250, unit: "g")
        insertRecipeIngredients(recipe_id: 13, item: "Oil", quantity: 2, unit: "tbsp")
        insertRecipeIngredients(recipe_id: 13, item: "Eggs", quantity: 4, unit: "")
        insertRecipeIngredients(recipe_id: 13, item: "Leeks", quantity:2, unit: "large")
        insertRecipeIngredients(recipe_id: 13, item: "Smoked Mackerel", quantity: 100, unit: "g")
        insertRecipeIngredients(recipe_id: 13, item: "Creamed horseradish", quantity: 2, unit: "tbsp")
        insertRecipeIngredients(recipe_id: 14, item: "Grated strong cheddar", quantity: 250, unit: "g")
        insertRecipeIngredients(recipe_id: 14, item: "Tomatoes", quantity: 4, unit: "")
        insertRecipeIngredients(recipe_id: 14 , item: "Chopped green chilli", quantity: 1, unit: "")
        insertRecipeIngredients(recipe_id: 14 , item: "Chopped coriander", quantity: 0.5, unit: "bunch")
        insertRecipeIngredients(recipe_id: 14 , item: "Flour tortillas", quantity: 8, unit: "")
        insertRecipeIngredients(recipe_id: 14 , item: "Oil, for brushing", quantity: 1, unit: "tbsp")
        insertRecipeIngredients(recipe_id: 15, item: "Oven-roasted vegetables", quantity: 400, unit: "g")
        insertRecipeIngredients(recipe_id: 15, item: "Can of kidney beans", quantity: 400, unit: "g")
        insertRecipeIngredients(recipe_id: 15, item: "Can of chopped tomatoes", quantity: 400, unit: "g")
        insertRecipeIngredients(recipe_id: 15, item: "Mixed rice pouch", quantity: 1, unit: "pouch")
        insertRecipeIngredients(recipe_id: 16, item: "Penne pasta", quantity: 200, unit: "g")
        insertRecipeIngredients(recipe_id: 16, item: "Sundried tomatoes", quantity: 60, unit: "g")
        insertRecipeIngredients(recipe_id: 16, item: "Skinless salmon fillets", quantity: 2, unit: "")
        insertRecipeIngredients(recipe_id: 16, item: "Spinach", quantity: 80, unit: "g")
        insertRecipeIngredients(recipe_id: 17, item: "Raw prawns", quantity: 200, unit: "g")
        insertRecipeIngredients(recipe_id: 17, item: "Chopped coriander", quantity: 1, unit: "handful")
        insertRecipeIngredients(recipe_id: 17, item: "Pad thai noodles", quantity: 400, unit: "g")
        insertRecipeIngredients(recipe_id: 17, item: "Beansprouts", quantity: 85, unit: "g")
        insertRecipeIngredients(recipe_id: 17, item: "Egg", quantity: 1, unit: "")
        insertRecipeIngredients(recipe_id: 17, item: "Juiced lime", quantity: 1, unit: "")
        insertRecipeIngredients(recipe_id: 17, item: "Fish sauce", quantity: 1, unit: "tbsp")
        insertRecipeIngredients(recipe_id: 17, item: "Sugar", quantity: 2, unit: "tsp")
        insertRecipeIngredients(recipe_id: 17, item: "Roasted peanuts", quantity: 1, unit: "tbsp")
        insertRecipeIngredients(recipe_id: 18, item: "Asparagus", quantity: 1, unit: "bunch")
        insertRecipeIngredients(recipe_id: 18, item: "Double cream", quantity: 142, unit: "ml")
        insertRecipeIngredients(recipe_id: 18, item: "Garlic", quantity: 2, unit: "cloves")
        insertRecipeIngredients(recipe_id: 18, item: "Parmesan", quantity: 50, unit: "g")
        insertRecipeIngredients(recipe_id: 18, item: "Tagliatelle", quantity: 250, unit: "g")
        insertRecipeIngredients(recipe_id: 19, item: "Small ciabatta", quantity: 1, unit: "")
        insertRecipeIngredients(recipe_id: 19, item: "Small Fennel bulb", quantity: 1, unit: "")
        insertRecipeIngredients(recipe_id: 19, item: "Olive Oil", quantity: 1, unit: "tbsp")
        insertRecipeIngredients(recipe_id: 19, item: "Rocket", quantity: 1, unit: "handful")
        insertRecipeIngredients(recipe_id: 19, item: "Mozzarella", quantity: 63, unit: "g")
        insertRecipeIngredients(recipe_id: 19, item: "Salami", quantity: 8, unit: "slices")
        insertRecipeIngredients(recipe_id: 19, item: "Lemon wedges", quantity: 2, unit: "")

    }
    
    func createTable() {
        let createTableQuery = "CREATE TABLE IF NOT EXISTS Ingredients (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, quantity DOUBLE, unit TEXT)"

        if sqlite3_exec(db, createTableQuery, nil, nil, nil) == SQLITE_OK {
            print("Table Created")
            let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
            
            print("App Path: \(dirPaths)")
        } else { return}
    
    }
    
    func createRecipeTable() {
        let createTableQuery = "CREATE TABLE IF NOT EXISTS Recipes (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, ingredients TEXT, method TEXT , attachment TEXT)"
        
        if sqlite3_exec(db, createTableQuery, nil, nil, nil) == SQLITE_OK {
            print("Table Created")
            return
        } else {return}
    }
    
    func dropTable() {
        let dropQuery = "DROP TABLE Ingredients"
        
        if sqlite3_exec(db,dropQuery, nil, nil, nil) == SQLITE_OK{
             print("Table Droped")
        } else {return}
    }
    
    func dropRecipeTable() {
        let dropQuery = "DROP TABLE Recipes"
        
        if sqlite3_exec(db, dropQuery, nil, nil, nil) == SQLITE_OK {
           print("Table Droped")
        } else {return}
    }
    
    func dropRecipeIngredientTable() {
        let dropQuery = "DROP TABLE Recipe_Ingredients"
        
        if sqlite3_exec(db, dropQuery, nil, nil, nil) == SQLITE_OK {
          print("Table Droped")
        } else {return}
    }
    
    func dropListTable() {
        let dropQuery = "DROP TABLE Lists"
        
        if sqlite3_exec(db, dropQuery, nil, nil, nil) == SQLITE_OK {
           print("Table Droped")
        } else {return}
    }

    func createRecipeIngredientsTable() {
        let createTableQuery = "CREATE TABLE IF NOT EXISTS Recipe_Ingredients (id INTEGER PRIMARY KEY AUTOINCREMENT, recipe_id REFERENCES Recipes(id), item TEXT, quantity DOUBLE , unit TEXT)"
        
        if sqlite3_exec(db, createTableQuery, nil, nil, nil) == SQLITE_OK {
             print("Table Created")
        } else {return}
    }
    
    func createListsTable() {
        let createTableQuery = "CREATE TABLE IF NOT EXISTS Lists (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, quantity DOUBLE, unit TEXT)"
        
        if sqlite3_exec(db, createTableQuery, nil, nil, nil) == SQLITE_OK {
            print("Table Created")
        } else {return}
    }
    
    func insertIngredients(name: String, quantity: Double, unit: String) {
        
        var stmt: OpaquePointer?
        let SQLITETRANSIENT = unsafeBitCast(OpaquePointer(bitPattern: -1), to: sqlite3_destructor_type.self)
        
        let queryString = "INSERT INTO Ingredients (name, quantity, unit) VALUES (?,?,?)"
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) == SQLITE_OK && sqlite3_bind_text(stmt, 1, name, -1, SQLITETRANSIENT) == SQLITE_OK && sqlite3_bind_double(stmt, 2, quantity ) == SQLITE_OK && sqlite3_bind_text(stmt, 3, unit, -1, SQLITETRANSIENT ) == SQLITE_OK && sqlite3_step(stmt) == SQLITE_DONE {
            print("Ingredients saved successfully")
        } else {return}
    }
    
    func insertRecipe(name: String, ingredients: String, method: String, attachment: String) {
        
        var stmt: OpaquePointer?
        let SQLITETRANSIENT = unsafeBitCast(OpaquePointer(bitPattern: -1), to: sqlite3_destructor_type.self)
        
        let queryString = "INSERT INTO Recipes (name, ingredients, method, attachment) VALUES (?,?,?,?)"
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) == SQLITE_OK && sqlite3_bind_text(stmt, 1, name, -1, SQLITETRANSIENT) == SQLITE_OK && sqlite3_bind_text(stmt, 2, ingredients, -1, SQLITETRANSIENT) == SQLITE_OK && sqlite3_bind_text(stmt, 3, method, -1, SQLITETRANSIENT) == SQLITE_OK && sqlite3_bind_text(stmt, 4, attachment, -1, SQLITETRANSIENT ) == SQLITE_OK && sqlite3_step(stmt) == SQLITE_DONE {
            print("Recipe saved successfully")
        } else {return}
    }
    
    func insertRecipeIngredients(recipe_id: Int32, item: String, quantity: Double, unit: String) {
        
        var stmt: OpaquePointer?
        let SQLITETRANSIENT = unsafeBitCast(OpaquePointer(bitPattern: -1), to: sqlite3_destructor_type.self)
        
        let queryString = "INSERT INTO Recipe_Ingredients (recipe_id, item, quantity, unit) VALUES (?,?,?,?)"
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) == SQLITE_OK && sqlite3_bind_int(stmt, 1, recipe_id ) == SQLITE_OK && sqlite3_bind_text(stmt, 2, item, -1, SQLITETRANSIENT) == SQLITE_OK && sqlite3_bind_double(stmt, 3, quantity ) == SQLITE_OK && sqlite3_bind_text(stmt, 4, unit, -1, SQLITETRANSIENT ) == SQLITE_OK && sqlite3_step(stmt) == SQLITE_DONE {
            print("Recipe Ingredients saved successfully")
        } else {return}
    }
    
    func insertOneIngredientToList(name: String, quantity: Double, unit: String) {
        
        var stmt: OpaquePointer?
        let SQLITETRANSIENT = unsafeBitCast(OpaquePointer(bitPattern: -1), to: sqlite3_destructor_type.self)
        
        let queryString = "INSERT INTO Lists (name, quantity, unit) VALUES (?,?,?)"
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) == SQLITE_OK && sqlite3_bind_text(stmt, 1, name, -1, SQLITETRANSIENT) == SQLITE_OK && sqlite3_bind_double(stmt, 2, quantity ) == SQLITE_OK && sqlite3_bind_text(stmt, 3, unit, -1, SQLITETRANSIENT ) == SQLITE_OK && sqlite3_step(stmt) != SQLITE_DONE {
            print("Ingredients saved successfully")
        } else {return}
    }
    
    func insertList(recipeID: Int) -> [Ingredient] {

        var stmt: OpaquePointer?
        let recipeIDString = String(recipeID)
        var ingredientList = [Ingredient]()
        ingredientList.removeAll()

        let queryString = "SELECT * FROM Recipe_Ingredients WHERE recipe_id = " + recipeIDString

        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK {
            print("error preparing insert")
            return []
        }

        while sqlite3_step(stmt) == SQLITE_ROW {
            let recipe_gredient_id = sqlite3_column_int(stmt, 0)
            let name = String(cString: sqlite3_column_text(stmt, 2))
            let quantity = sqlite3_column_double(stmt, 3)
            let unit = sqlite3_column_text(stmt, 4)

            ingredientList.append(Ingredient(id: Int(recipe_gredient_id), name: name, quantity: Double(quantity), unit: String(cString: unit!)))
        }
        
        for ingredient in ingredientList {
        
            insertOneIngredientToList(name: ingredient.name, quantity: ingredient.quantity, unit: ingredient.unit)
        }
        
        return ingredientList
    }

    func showList() -> [Ingredient] {
        var list = [Ingredient]()
        list.removeAll()
        let queryString = "SELECT * FROM Lists"
        var stmt:OpaquePointer?
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK {
            print("error preparing insert")
            return []
        }
        
        while sqlite3_step(stmt) == SQLITE_ROW {
            let id = sqlite3_column_int(stmt, 0)
            let name = String(cString: sqlite3_column_text(stmt, 1))
            let quantity = sqlite3_column_double(stmt, 2)
            let unit = sqlite3_column_text(stmt, 3)
            
            list.append(Ingredient(id: Int(id), name: name, quantity: Double(quantity), unit: String(cString: unit!)))
        }
        return list
    }
    
    func checkStock() -> [Ingredient] {
        var stock = [Ingredient]()
        stock.removeAll()
        let queryString = "SELECT * FROM Ingredients"
        var stmt:OpaquePointer?
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return []
        }
        
        while sqlite3_step(stmt) == SQLITE_ROW {
            let id = sqlite3_column_int(stmt, 0)
            let name = String(cString: sqlite3_column_text(stmt, 1))
            let quantity = sqlite3_column_double(stmt, 2)
            let unit = sqlite3_column_text(stmt, 3)
            
            stock.append(Ingredient(id: Int(id), name: name, quantity: Double(quantity), unit: String(cString: unit!)))
        }
        return stock
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
    
    func deleteListItem(name: String) {
        let deleteStatementStirng = "DELETE FROM Lists WHERE Name = '" + name + "';"
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
    
    func showRecipes() -> [Recipe] {
        var recipe = [Recipe]()
        recipe.removeAll()
        
        let queryString = "SELECT DISTINCT id,name, ingredients, method, attachment FROM Recipes INNER JOIN (SELECT DISTINCT recipe_id, item FROM Recipe_Ingredients INNER JOIN Ingredients ON Recipe_Ingredients.item LIKE '%' || Ingredients.name || '%') ON Recipes.id = recipe_id"
        
        var stmt:OpaquePointer?
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return []
        }
        
        //traversing through all the records
        while sqlite3_step(stmt) == SQLITE_ROW {
            let id = sqlite3_column_int(stmt, 0)
            let name = String(cString: sqlite3_column_text(stmt, 1))
            let ingredients = String(cString: sqlite3_column_text(stmt, 2))
            let method = String(cString: sqlite3_column_text(stmt, 3))
            let attachment = String(cString: sqlite3_column_text(stmt, 4))
            
            recipe.append(Recipe(id: Int(id), name: name, ingredients: ingredients, method: method, attachment: attachment))
        }
        
        return recipe
    }

    func matchRecipeNameWithID(name: String) -> Int {
        var recipes = [Recipe]()
        recipes.removeAll()
        
        let queryString = "SELECT * FROM Recipes WHERE name = '" + name + "';"
        var stmt:OpaquePointer?
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK {
            print("error preparing insert s")
            return 1
        }
        
        while sqlite3_step(stmt) == SQLITE_ROW {
            let id = sqlite3_column_int(stmt, 0)
            let name = String(cString: sqlite3_column_text(stmt, 1))
            let ingredients = String(cString: sqlite3_column_text(stmt, 2))
            let method = String(cString: sqlite3_column_text(stmt, 3))
            let attachment = String(cString: sqlite3_column_text(stmt, 4))
            
            recipes.append(Recipe(id: Int(id), name: name, ingredients: ingredients, method: method, attachment: attachment))
        }
        return recipes[0].id
    }
}
