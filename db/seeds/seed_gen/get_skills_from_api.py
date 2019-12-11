from requests import get
from json import loads, dumps
import time
import pprint

start_time = time.time()

pp = pprint.PrettyPrinter(indent=2, compact=True)

api_url = 'http://www.dnd5eapi.co/api/'

skills_list = []

all_skills_r = get(api_url + 'skills/')
all_skills = loads(all_skills_r.text)

for i in range(1, all_skills['count'] + 1):
  skill_r = get(api_url + f'skills/{i}/')
  skill = loads(skill_r.text)
  
  skill_seed = {}
  skill_seed.update({ 'name': skill['name'] })
  skill_seed.update({ 'name': skill['desc'] })
  skill_seed.update({ 'ability_score': skill['ability_score']['name'] })

  skills_list.append(skill_seed)
  
#   r = get(f'http://www.dnd5eapi.co/api/equipment/{i}/')
#   tempJSON = r.text
  
#   start = tempJSON.index('equipment_category') + len('equipment_category":"')
#   end = start + tempJSON[start:].index('"')
  
#   category = tempJSON[start:end]
  
#   if not (category in category_list):
#     print(i)
#     temp_file = open(f'equipment_type/{category}.json', 'w')
#     temp_file.write(tempJSON)
#     temp_file.close()
#     category_list.append(category)

pp.pprint(skills_list)
# print(time.time() - start_time)
