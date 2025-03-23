# n8n Self-Hosted on Render with Custom Domain

This repository contains a modular setup for deploying a self-hosted n8n server on Render with a custom domain configured as the webhook URL.

## Repository Structure

- `Dockerfile`: Customized Docker image for n8n
- `docker-compose.yml`: Local development configuration
- `render.yaml`: Render deployment configuration
- `.env.example`: Example environment variables for local development

## Deployment to Render

### Prerequisites

1. A Render account
2. A custom domain that you want to use for your n8n instance (optional but recommended)

### Deployment Steps

1. Fork this repository to your GitHub account
2. Create a new Blueprint on Render and connect to your forked repository
3. Render will automatically detect the `render.yaml` file
4. During deployment, set the following environment variables:
   - `WEBHOOK_URL`: Set to your custom domain (e.g., `https://n8n.yourdomain.com`)
   - `N8N_HOST`: Set to your custom domain without protocol (e.g., `n8n.yourdomain.com`)

### Custom Domain Configuration

The `render.yaml` includes a custom domain section. Update it with your desired domain:

```yaml
customDomains:
  - domain: n8n.yourdomain.com
    type: PRIMARY
```

After deployment, follow Render's documentation to configure DNS records for your custom domain.

## Local Development

1. Copy the example environment file:
   ```bash
   cp .env.example .env
   ```

2. Modify the `.env` file with your desired settings

3. Run with Docker Compose:
   ```bash
   docker-compose up -d
   ```

This will start n8n on `http://localhost:5678`.

## Environment Variables

See the `.env.example` file for a comprehensive list of available environment variables. The most important ones are:

- `DATABASE_TYPE`: Type of database to use
- `DB_POSTGRESDB_*`: Database connection details
- `N8N_ENCRYPTION_KEY`: Secret key for encrypting credentials
- `WEBHOOK_URL`: URL for webhooks (important for proper functionality)

When deploying to Render, these variables are set automatically based on the `render.yaml` configuration.

## Scaling and Customization

- You can modify the Dockerfile to add custom dependencies or configurations
- Adjust disk sizes in `render.yaml` based on your needs
- Change the PostgreSQL version if needed
- Add additional environment variables in the `.env` file for local development or in `render.yaml` for deployment

## Security Considerations

- Use a strong password for the n8n admin account
- Consider IP restrictions on Render
- Enable two-factor authentication for your Render account
- Regularly backup your workflows
- Set a strong `N8N_ENCRYPTION_KEY` value

## Maintenance

Render will automatically rebuild your application when you push changes to your repository. To update n8n to a newer version, update the base image version in the Dockerfile.