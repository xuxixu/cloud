package Test;

import com.cloud.dao.HdfsDao;
import com.cloud.pojo.User;
import com.cloud.utils.C3P0Utils;
import org.apache.commons.compress.utils.IOUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataOutputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.junit.jupiter.api.Test;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class testData {

    @Test
    public void findUser() {
        String sql = "UPDATE panuser SET password = '12345' WHERE user = 'test01' ";
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        int i=0;
        try {
            i = queryRunner.update(sql);
            System.out.println(i);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Test
    public  void upload() throws IllegalArgumentException, IOException, InterruptedException, URISyntaxException {
        HdfsDao.upload("test1",new FileInputStream("c.txt"));
        }

}
