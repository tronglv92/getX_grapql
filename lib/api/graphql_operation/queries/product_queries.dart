const productsGraphQL = """
query products{
products(first: 5, channel: "default-channel") {
    edges {
      node {
        id
        name
        description
        thumbnail{
          url
        }
      }
    }
  }
}
""";