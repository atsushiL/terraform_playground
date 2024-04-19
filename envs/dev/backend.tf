terraform {
  cloud {
    organization = "tf-gura"

    workspaces {
      name = "ws-dev-kyoto"
    }
  }
}
