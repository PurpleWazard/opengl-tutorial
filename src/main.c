#include "glad/glad.h"
#include <GL/gl.h>
#include <GL/glext.h>
#include <GLFW/glfw3.h>
#include <stdio.h>

int main(){

  // init
  glfwInit();
  // tell glfw what version of opengl we are using
  glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
  glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
  // which profile.. core or legacy
  glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

  // window opject
  GLFWwindow * window = glfwCreateWindow(800, 600, "learning that opengl", NULL, NULL);
  // check if its null
  if ( window == NULL ){
    printf("glfw window is NULL exiting ...\n");
    glfwTerminate();
    return -1;
  }

  glfwMakeContextCurrent(window);

  // init GLAD
  if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress)){
    printf("didnt init GLAD\n");
    return -1;
  }

  // made function for opengl to call when windows is resized. the delcreation must be like this.
  void framebuffer_size_callback(GLFWwindow* window, int width, int height){
    glViewport(0, 0, width, height);
  }


  while(!glfwWindowShouldClose(window))
{
    //glfwSwapBuffers(window);
    glfwPollEvents();    
}

  
glfwTerminate();


  return 0;
}
