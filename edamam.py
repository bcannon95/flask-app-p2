import requests
import json

KEY = '343f7be662b2a1d06f43d163d0bfc906'
ID = 'b8564760'


def get_recipes(ingredients):
    recipe_params = {
        'q': ingredients,
        'app_key': KEY,
        'app_id': ID,
        'type':'public'
    }

    response = requests.get(f'https://api.edamam.com/api/recipes/v2', params=recipe_params)
    recipe_json = response.json()

    return recipe_json

if __name__ == '__main__':  
    recipe = get_recipes('chicken, rice, lettuce') 
    print(json.dumps(recipe, indent=4))