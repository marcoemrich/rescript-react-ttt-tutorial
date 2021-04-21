import WindiCSS from 'vite-plugin-windicss'

export default {
  plugins: [
    WindiCSS({
      scan: {
        dirs: ['src'],
        fileExtensions: ['js'],
      }
    }),
  ],
}
