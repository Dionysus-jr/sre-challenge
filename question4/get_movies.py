import requests

def getMovieTitles(substr):
    #sned a GET request to the API with the search string
    response = requests.get(f'https://jsonmock.hackerrank.com/api/movies/search/?Title={substr}')
    
    #parse the JSON response into a Python dictionary
    data = response.json()
    
    # extract the list of movie records from the data
    movies = data['data']
    
    #Collect all movie titles into a list
    titles = [movie['Title'] for movie in movies]
    
    #Sort titles and return the list
    return sorted(titles)

movie_name = input("Search: ")
print(getMovieTitles(movie_name))
