![Frame 1 (1)](https://user-images.githubusercontent.com/70981102/134086600-28a6824f-d227-4612-85fb-12356ca7cdfc.png)

On Tea Way is a tea subscription service that customizes tea packaging with images from the user. This is the backend app that stores user, tea, subscription information and serves information to the (eventual) front endapp. 

I've created this API as a submission to [Shopify's BackEnd Engineering Internship](https://docs.google.com/document/d/1eg3sJTOwtyFhDopKedRD6142CFkDfWp1QvRKXNTPIOc/edit). 

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
        <li><a href="#testing">Testing</a></li>
      </ul>
    </li>
   <li><a href="#schema">Schema</a></li>
    <li><a href="#graphql-endpoints">GraphQL Endpoints</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>

## About this Project 
<div display="inline-block"> 
 <img src="https://img.shields.io/badge/RAILS-CC0000?logo=rubyonrails&logoColor=fff&style=flat-square" alt="Rails Badge"> 
 <img src="https://img.shields.io/badge/CircleCI-343434?logo=circlecis&logoColor=fff&style=flat-square" alt="CircleCI Badge"> 
 <img src="https://img.shields.io/badge/GraphQL-E434AA?logo=graphql&logoColor=fff&style=flat-square" alt="GraphQL Badge"> 
 <img src="https://img.shields.io/badge/Heroku-430098?logo=heroku&logoColor=fff&style=flat-square" alt="Heroku Badge"> 
</div>

### Current Features 
- Upload photo for tea packaging 
- Search Unsplash for photo and add as photo for packaging 
- See all photos that belong to given user 

### Future Features 
- Delete uploaded photos 
- Update uploaded photos
- Get Subscription information 
- Create Package Photos 

#### Important Gems 
- Testing: factory-bot_rails, faker, pry, shoulda-matchers, simplecov, webmock, vcr
- Dev/Production: aws-sdk-s3, apollo_upload_server, image_processing
- API: faraday, graphql

#### Schema 

<div align="center">
 <img width="890" alt="Screen Shot 2021-09-20 at 8 17 27 PM" src="https://user-images.githubusercontent.com/70981102/134093534-20401856-1f2b-420d-accd-d97a1c2960eb.png">
</div>

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

» [Ruby](https://www.ruby-lang.org/en/) version 2.7.2<br />
» [Rails](https://rubyonrails.org/) version 5.2.6

### Installation

1. Clone the repo
   ```rb
   git clone https://github.com/suzkiee/on_tea_way.git
   ```
2. Install gems
   ```rb
   bundle install
   ```
3. Run
   ```rb
   rails db:{create,migrate,seed}
   ```
   
### Testing
[RSpec](https://rspec.info/)

1. To run testing suite
    ```rb
    bundle exec rspec
    ```

## GraphQL Endpoints 

### Testing 

To test enpoints 
1. Download [Altair GraphiQL Client](https://altair.sirmuel.design/#download)*

2. Copy + paste GraphQL codeblock from below into left hand side of client
<img width="1348" alt="Screen Shot 2021-09-20 at 8 46 14 PM" src="https://user-images.githubusercontent.com/70981102/134096321-2442167c-b5b4-4c11-acaa-0444734cf3a9.png">

* *We are using Altair because it allows you to attach files to your mutation queries. Graphiql does not currently have that feature.*

### Queries 

userPhotos: returns all users in database 
``` graphql 
query {
  userPhotos(id: 1){
    id
    photos {
      id
      userUploaded
      unsplashId
      userPhotoUrl
    }
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
   uploadUserPhoto(input: {
         upload: $file
         userId: 1
         }) {
              userId
              unsplashId
              userUploaded
            }
          }
```
uploadUnsplashPhoto: uploads photo using Unsplash url and id 
```graphql  
mutation {
   uploadUnsplashPhoto(input: { 
         url: "https://images.unsplash.com/photo-1593134257782-e89567b7718a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTEwMzZ8MHwxfHNlYXJjaHwxfHxwdXBweXxlbnwwfHx8fDE2MzIxNDM2MzY&ixlib=rb-1.2.1&q=80&w=1080"
         userId: 1
         }) {
              userId
              unsplashId
              userUploaded
              url 
            }
          }
```
## Contact

Suzie Kim - [Linkedin](https://www.linkedin.com/in/suzanne-kim//) - [GitHub](https://github.com/suzkiee) - [Email](suziekim.dev@gmail.com)

Project Link: [Tea Time](https://github.com/suzkiee/on_tea_way)


## Acknowledgements

» [README Template Source](https://github.com/othneildrew/Best-README-Template)<br />
» [Shopify BackEnd Developer Intership Posting](https://www.shopify.ca/careers/backend-developer-intern-remote-winter-2022-6932cbed)
