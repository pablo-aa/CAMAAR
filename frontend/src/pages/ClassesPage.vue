<script setup>
// import ProfessorComponentT1 from "src/components/GraficoProfessorTipo1.vue";
// import ProfessorComponentT2 from "src/components/GraficoProfessorTipo2.vue";
import AvaliationComponent from "src/components/GraficoAvaliacao.vue";
// import ReportDownload from "/src/components/ReportDownload.vue";
</script>

<script>
export default {
  data() {
    return {
      isHidden: true,
      graficoTipo1: true,
      graficoTipo2: false,
      api_change: true,
      api_url_child: null,
    };
  },
  methods: {
    toggle() {
      this.isHidden = !this.isHidden;
    },
    api() {
      // this.api_change = !this.api_change;
      this.graficoTipo1 = !this.graficoTipo1;
      this.graficoTipo2 = !this.graficoTipo2;
      // if (this.api_change) {
      //   this.api_url_child =
      //     "https://canvasjs.com/services/data/datapoints.php?length=5&type=json";
      // } else {
      //   this.api_url_child =
      //     "https://canvasjs.com/services/data/datapoints.php?xstart=1&ystart=1&length=5&type=json";
      // }
      if (this.graficoTipo1) {
        this.api_url_child =
          "https://canvasjs.com/services/data/datapoints.php?length=5&type=json";
      } else {
        this.api_url_child =
          "https://canvasjs.com/services/data/datapoints.php?xstart=1&ystart=1&length=3&type=json";
      }
    },
  },
};
</script>

<template>
  <div>
    <div>
      <!-- <div>oi</div> -->
      <!-- <div class="q-pa-md q-gutter-sm">
        <q-btn
          @click="toggle"
          color="primary"
          label="Mostrar/Ocultar Gráfico"
        />
        <q-btn @click="api" color="primary" label="Mudar API" />
      </div> -->
      <!-- <ReportDownload /> -->
    </div>
    <!-- <div v-if="isHidden && graficoTipo1">
      <ProfessorComponentT1 :api_url="api_url_child" />
    </div>
    <div v-if="isHidden && graficoTipo2">
      <ProfessorComponentT2 :api_url="api_url_child" />
    </div> -->
    <div>
      <AvaliationComponent api_url="http://localhost:3030/avaliations" />
    </div>
  </div>
</template>