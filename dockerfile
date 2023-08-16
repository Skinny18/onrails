# Use an official Ruby runtime as a parent image
FROM ruby:2.7

# Set the working directory in the container
WORKDIR /app

RUN gem install rails

# Copy the Gemfile and Gemfile.lock into the container at /app

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
CMD ["bin/rails", "server", "-b", "0.0.0.0", "-p", "3000"]
