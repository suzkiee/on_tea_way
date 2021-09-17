![Frame 1](https://user-images.githubusercontent.com/70981102/133642726-e629b398-335c-4cdd-a576-bcaec0fbfd5a.png)

On Tea Way is a tea subscription service that customizes tea packaging with images from the user. Users can either search for an image from the Unsplash API or upload their own. 

I built this API as part of my application to Shopify's BackEnd Engineering Internship Program. Currently, this is API only. 

#### Schema 
<img width="940" alt="Screen Shot 2021-09-16 at 9 00 17 PM" src="https://user-images.githubusercontent.com/70981102/133783814-1bf10226-94ff-4f3c-8254-00ab42e307ef.png">

#### Versions



## GraphQL Endpoints 

### Queries 
getUsers: returns all users in database 
``` graphql 
query {
  getUsers{
     firstName
     lastName
     email
     address
     passwordDigest
    }
  }
```

searchPhotos: returns photos that match query from Unsplash API

``` graphql 
query {
  searchPhotos(query: "puppy"){
      url
      unsplashId
      userUploaded
    }
  }
```
### Mutations

uploadUserPhoto: uploads User Photo 

``` graphql 
mutation($file: Upload!) {
   uploadUserPhoto(input: {upload: $file}) {
              id
              unsplashId
              userUploaded
            }
          }
```
