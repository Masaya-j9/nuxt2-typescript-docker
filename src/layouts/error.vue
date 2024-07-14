<template>
  <div>
    <h1 v-if="error">{{ error.message }}</h1>
    <p>{{ otherError }}</p>
  </div>
</template>

<script lang="ts">

import Vue from 'vue';
import { MetaInfo } from 'vue-meta';
import { Context } from '@nuxt/types';

interface ErrorLayout extends Vue {
  error: Error | null;
  pageNotFound: string;
  otherError: string;
  head: () => MetaInfo;
}

export default Vue.extend({
  data() {
    return {
      error: null as Error | null,
      pageNotFound: 'Page not found',
      otherError: 'An error occurred',
    };
  },
  head(): MetaInfo {
    return {
      title: 'Error Page',
      // その他の head 設定
    };
  },
  async asyncData(context: Context) {
    return { error: context.error };
  },
  created() {
    (this as any).$options.layout = 'error';
  }
});
</script>

<style scoped>
h1 {
  font-size: 20px;
}
</style>
