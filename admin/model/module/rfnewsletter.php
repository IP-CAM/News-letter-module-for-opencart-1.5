<?php
	class ModelModuleRfnewsletter extends Model {
		public function createTable($data) {
			$this->db->query("CREATE TABLE IF NOT EXISTS `rfnewsletter` (
							  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
							  `name` varchar(255) DEFAULT NULL,
							  `email` varchar(255) DEFAULT NULL,
							  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
							  PRIMARY KEY (`id`)
							) ");
		}

		public function getData() {
			$query = $this->db->query("select * from rfnewsletter");

			return $query->rows;
		}
		/**/
		public function deleteData($id=0) {
			$query = $this->db->query("DELETE FROM rfnewsletter WHERE id='".$id."'");
			return true;
		}
	}
?>