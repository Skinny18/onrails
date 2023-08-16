# Use an official Ruby runtime as a parent image
FROM ruby:3.2.2

# Set the working directory in the container
WORKDIR /app

RUN gem install rails

COPY . .

# Install Node.js and Yarn
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs npm
RUN npm install -g yarn
# Install dependencies
RUN bundle install

# Copy the rest of the application code into the container at /app
COPY . .

# Set environment variables
ENV RAILS_ENV=development

# Expose port 3000 to the Docker host, so we can access it from the outside
EXPOSE 3000

ENV PATH="/app/bin:${PATH}"



# Start the Rails server when the container is run
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]