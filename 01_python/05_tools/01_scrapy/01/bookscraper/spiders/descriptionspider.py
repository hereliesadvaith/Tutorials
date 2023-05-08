# crawl through single book pages to get the description of books
import scrapy


class DescriptionSpider(scrapy.Spider):
    name = "descriptionspider"
    allowed_domains = ["books.toscrape.com"]
    start_urls = ["http://books.toscrape.com/"]

    def parse(self, response):
        # get books from response html
        books = response.css("article.product_pod")
        for book in books:
            description_url = book.css("h3 a ::attr(href)").get()
            yield response.follow(description_url, callback=self.descrptionParse)
        next_page = response.css("li.next a ::attr(href)").get()
        if "catalogue" in next_page:
            next_page_url = "https://books.toscrape.com/" + next_page
        else:
            next_page_url = "https://books.toscrape.com/catalogue/" + next_page
        # recursion
        yield response.follow(next_page_url, callback=self.parse)

    def descrptionParse(self, response):
        yield {
            "name": response.css("h1 ::text").get(),
            "description": response.css(
                # if the pargraph is directly under the divsion or use p:nth-of-type(2)
                "article.product_page > p:first-of-type::text"
            ).get(),
        }
